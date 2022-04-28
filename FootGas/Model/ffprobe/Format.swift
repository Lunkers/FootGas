//
//  Format.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

struct Format: Codable {
    let file_name: String
    let format_name: String
    let format_long_name: String?
    let duration: Double
    let size: Int64
    let bit_rate: Int64
}
