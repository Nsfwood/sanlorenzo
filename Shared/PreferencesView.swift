//
//  Preferences.swift
//  sanlorenzo
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        Form {
            //Divider()
            Button("Acknowledgements") {}
            Button("Donate") {}
            Button("Help With Translations") {}
            Button("Report a Bug") {}
            Text("Made with ❤️")
        }.padding()
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
