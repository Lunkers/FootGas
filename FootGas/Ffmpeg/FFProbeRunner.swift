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
        
        if let probeResult = try? decoder.decode(FfprobeResult.self, from: resultJson!) {
            return probeResult
        }
        else {
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
            print("ffprobe complete")
            if let data = try? Data(outputPipe.fileHandleForReading.readToEnd()!) {
                print(data)
                return data
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
