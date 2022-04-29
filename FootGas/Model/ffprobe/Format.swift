//
//  Format.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

// TODO: figure out a way to decode to numeric types here
struct Format: Codable {
    let filename: String
    let nb_streams: Int?
    let nb_programs: Int?
    let format_name: String
    let format_long_name: String?
    let start_time: String
    let duration: String
    let size: String
    let bit_rate: String
    let probe_score: Int
    
}
