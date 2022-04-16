//
//  Stream.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

struct Stream: Codable {
    let index: Int
    let codec_name: String?
    let codec_long_name: String?
    let profile: String?
    let codec_type: String?
    let codec_tag: String
    let codec_tag_string: String
    let start_pts: Int64?
    let start_time: Double?
    let duration_ts: Int64?
    let duration: Double?
    let bit_rate: Int64?
    let max_bitrate: Int64?
    let bits_per_raw_sample: Int?
    let nb_frames: Int?
}

