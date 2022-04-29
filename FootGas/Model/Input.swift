//
//  Input.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import Foundation


protocol Input {
    var uri: String { get }
    
    var params: [String: String] { get }
    
    var type: String { get }
    
}

struct AudioInput: Input & Codable {
    
    var uri: String
    
    var params: [String: String]
    
    var type: String = "AUDIO"
    
    var audioLabel: String
    
    var useFirstAudioStreams: Int?
    
    var audioFilters: [String]
    
    
}

struct VideoInput: Input & Codable {
    
    var uri: String
    
    var params: [String: String]
    
    var type: String = "VIDEO"
    
    var videoLabel: String
    
    var dar: String
    
    var videoFilters: [String]
    
    var videoStream: Int?
    
}

struct AudioVideoInput: Input & Codable {
    var uri: String
    
    var videoLabel: String = "main"
    
    var audioLabel: String = "main"
    
    var params: [String: String]
    
    var dar: String
    
    var useFirstAudioStreams: Int?
    
    var videoFilters: [String]
    
    var AudioFilters: [String]
    
    var type: String = "AudioVideo"
    
    var videoStream: Int? = nil
    
    var audioStream: Int? = nil
    
}

