//
//  FFProbeRunner.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

class FFProbeRunner {
    static let urlString = "/usr/local/bin/ffprobe"
    
    
    func probeFile(fileName: String) -> FfprobeResult? {
        let decoder = JSONDecoder()
        let resultJson = runFfProbe(fileName: fileName)
        do {
            let probeResult: FfprobeResult = try decoder.decode(FfprobeResult.self, from: resultJson!)
            print(probeResult)
            return probeResult
            
            
        } catch {
            print("JSON decode failed")
            print(error)
            return nil
        }
        
    }
    
    private func runFfProbe(fileName: String) -> Data? {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: FFProbeRunner.urlString)
        
        let commands = [
            "-i",
            fileName,
            "-v",
            "quiet",
            "-print_format",
            "json",
            "-show_streams",
            "-show_format"
        ]
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        
        process.arguments = commands
        do {
            try
            process.run()
            process.waitUntilExit()
            if let data = try? Data(outputPipe.fileHandleForReading.readToEnd()!) {
                
                return String(decoding: data, as: UTF8.self).data(using: .utf8)
            } else {
                print("No data")
                return nil
            }
        } catch {
            print ("error when trying to run process")
            print("More info: \(error)")
            return nil
        }
    }
}
