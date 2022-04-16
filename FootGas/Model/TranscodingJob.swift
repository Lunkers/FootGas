//
//  TranscodingJob.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation

struct TranscodingJob: Identifiable, Codable {

    var id = UUID()
    var input: String
}

extension UUID: RawRepresentable {
    public init?(rawValue: String) {
        self = UUID(uuidString: rawValue)!
    }
    
    public var rawValue: String {
        return self.uuidString
    }
}

extension TranscodingJob {
    static var placeholder: Self {
        TranscodingJob(id: UUID(), input: "File.mp4")
    }
}
