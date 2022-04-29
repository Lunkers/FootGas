//
//  Stream.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

//TODO: Convert string results to numerical types
struct Stream: Codable {
    let index: Int
    let codec_name: String?
    let codec_long_name: String?
    let profile: String?
    let codec_type: String?
    let codec_tag: String
    let codec_tag_string: String
    let start_pts: Int64?
    let start_time: String?
    let duration_ts: Int64?
    let duration: String?
    let bit_rate: String?
    let max_bitrate: String?
    let bits_per_raw_sample: String?
    let nb_frames: String?
}

extension Stream: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return index
    }
}
