//
//  Store.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation

class Store: ObservableObject {
    @Published var jobs: [TranscodingJob] = [
        TranscodingJob(input: "Input 1"),
        TranscodingJob(input: "Input 2"),
        TranscodingJob(input: "Input 3"),
        TranscodingJob(input: "Input 4"),
    ]
    
    @Published var selectedJob: TranscodingJob.ID?
    
    
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
}
