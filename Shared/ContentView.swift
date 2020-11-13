//
//  ContentView.swift
//  Shared
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NationView().tabItem { Text("Nation") }
            CurrentStateView().tabItem { Text("State") }
            //StatesView().tabItem { Text("All States") }
        }.padding().frame(minWidth: 400, minHeight: 350)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
