//
//  sanlorenzoApp.swift
//  Shared
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

@main
struct sanlorenzoApp: App {
    
    @Environment(\.openURL) var openURL
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandGroup(after: CommandGroupPlacement.appInfo) {
                Button("Check for Updates...") { openURL(URL(string: "https://github.com/Nsfwood/sanlorenzo/releases")!) }
            }
        }
        #if os(macOS)
        Settings {
            PreferencesView()//.frame(width: 200, height: 200)
        }
        #endif
    }
}
