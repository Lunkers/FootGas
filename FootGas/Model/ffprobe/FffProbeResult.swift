//
//  FffProbeResult.swift
//  FootGas
//
//  Created by Foppe on 2022-04-16.
//

import Foundation

struct FfprobeResult: Codable {
    var format: Format?
    var streams: [Stream] = []
}
