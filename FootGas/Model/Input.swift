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

struct AudioInput: Input {
    
    var uri: String 
    
    var params: [String: String]
    
    var type: String
    
    var audioLabel: String
    
    var useFirstAudioStreams: Int?
    
    var audioFilters: [String]
    
    
}

struct VideoInput: Input {
    
    var uri: String
    
    var params: [String: String]
    
    var type: String
    
    var videoLabel: String
    
    var dar: String
    
    var videoFilters: [String]
    
    var videoStream: Int?
    
}

