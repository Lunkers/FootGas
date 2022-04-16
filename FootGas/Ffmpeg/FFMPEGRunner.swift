//
//  FFMPEGRunner.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation
import SwiftUI

class FfmpegRunner {
    
    static let ffmpegUrl = "/usr/local/bin/ffmpeg"
    
    func buildCommand() -> String {
        return "ffmpeg command here"
    }
    
    func runFfmpeg(transcodingJob: TranscodingJob, output: String) {
        
    }
    
    private func runFfmpeg(commands: [String], workDir: URL) -> (Pipe, Pipe) {
        let ffmpegProcess = Process()
        ffmpegProcess.executableURL = URL(fileURLWithPath: FfmpegRunner.ffmpegUrl)
        ffmpegProcess.arguments = commands
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        ffmpegProcess.standardOutput = outputPipe
        ffmpegProcess.standardError = errorPipe
        
        do {
            try ffmpegProcess.run()
        } catch {
            print("Failed to run ffmpeg!")
        }
    
        return (outputPipe, errorPipe)
    }
}
