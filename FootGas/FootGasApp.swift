//
//  FootGasApp.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import SwiftUI

@main
struct FootGasApp: App {
    
    @StateObject private var store = Store()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
        .commands {
            SidebarCommands()
        }
    }
}
