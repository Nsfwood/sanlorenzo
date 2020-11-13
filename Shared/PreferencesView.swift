//
//  Preferences.swift
//  sanlorenzo
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

struct PreferencesView: View {
    
    @Environment(\.openURL) var openURL
    @State var showAckPop = false
    
    var body: some View {
        Form {
            //Divider()
            Button("Acknowledgements") { showAckPop.toggle() }.popover(isPresented: self.$showAckPop, arrowEdge: .bottom) {
                VStack {
                    Text("Data Provider")
                    Divider()
                    Link("The Covid Tracking Project", destination: URL(string: "https://covidtracking.com/")!)
                    Text("No changes were made.")
                    Link("CC 4.0 License", destination: URL(string: "https://creativecommons.org/licenses/by/4.0/")!)
                }.padding()
            }
            Button("Donate") { openURL(URL(string: "https://www.buymeacoffee.com/BeAQzFbUP")!) }
            Button("Help With Translations") { openURL(URL(string: "https://alexanderrohrig.com/translationhelp")!) }
            Button("Report a Bug") { openURL(URL(string: "https://github.com/Nsfwood/sanlorenzo/issues")!) }
            Text("Made with ❤️")
        }.padding()
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
