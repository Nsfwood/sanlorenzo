//
//  sanlorenzoApp.swift
//  Shared
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

@main
struct sanlorenzoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        Settings {
            PreferencesView()//.frame(width: 200, height: 200)
        }
    }
}
