//
//  CurrentStateView.swift
//  sanlorenzo
//
//  Created by Alexander Rohrig on 11/13/20.
//

import SwiftUI

struct CurrentStateView: View {
    
    @ObservedObject var fetch = FetchCurrentStateData()
    @State var stateCode = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("State", text: $stateCode)
                Button(action: {
                    fetch.getCurrentState(state: stateCode)
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
            }.padding()
            Spacer()
            if let x = fetch.currentStateData {
                HStack {
                    Text("Currently Positive:")
                    Spacer()
                    Text("\(x.positive ?? 0)")
                }
                HStack {
                    Text("Increase in Positive Cases")
                    Spacer()
                    Text("\(x.positiveIncrease ?? 0)")
                }
                Spacer()
                Divider()
                Text("Updated \(x.lastUpdateEt ?? "nil")")
            }
        }.padding()
    }
}

struct CurrentStateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStateView()
    }
}
