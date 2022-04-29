//
//  TranscodingJob.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation
import SwiftUI
import QuickLook

struct TranscodingJob: Identifiable & Codable {
    
    var id = UUID()
    var inputUrl: String
    var fileName: String
    var input: AudioVideoInput?
    var streams: [Stream] = []
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
        TranscodingJob(id: UUID(), inputUrl: "File.mp4", fileName: "PlaceholderName", streams: [
            Stream(index: 1, codec_name: "hevc", codec_long_name: "High efficiency video codec", profile: "Main10", codec_type: "video", codec_tag: "hvc1", codec_tag_string: "hvc1", start_pts: nil, start_time: "0", duration_ts: nil, duration: "120", bit_rate:"3100000", max_bitrate: nil, bits_per_raw_sample: nil, nb_frames: nil)
        ])
    }
}

