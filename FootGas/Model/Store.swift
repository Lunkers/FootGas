//
//  Store.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation

class Store: ObservableObject {
    @Published var jobs: [TranscodingJob] = []
    
    @Published var selectedJob: TranscodingJob.ID?
    
    @Published var ffProbeRunner = FFProbeRunner()
    
    subscript(jobId: TranscodingJob.ID?) -> TranscodingJob {
        get {
            if let id = jobId {
                return jobs.first(where: {$0.id == id}) ?? .placeholder
            }
            else {
                return .placeholder
            }
        }
        set(newValue) {
            if let id = jobId {
                jobs[jobs.firstIndex(where: {$0.id == id})!] = newValue
            }
        }
    }
    
    func addTranscodingJob(url: URL?, fileName: String) throws{
        let probeResult = ffProbeRunner.probeFile(fileName: url!.path)
        let input = AudioVideoInput(uri: url!.path, params: [:], dar: "", videoFilters: [], AudioFilters: [])
        let job = TranscodingJob(inputUrl: url!.path, fileName: fileName, input: input, streams: probeResult?.streams ?? [], format: probeResult?.format)
        
        jobs.append(job)
    }
}
