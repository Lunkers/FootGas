//
//  TranscodingJob.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation

struct TranscodingJob: Identifiable & Codable {

    var id = UUID()
    var inputUrl: String
    var fileName: String
    var input: AudioVideoInput?
    var streams: [Stream]?
    var format: Format?
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
        TranscodingJob(id: UUID(), inputUrl: "File.mp4", fileName: "PlaceholderName")
    }
}
