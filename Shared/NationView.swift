//
//  NationView.swift
//  sanlorenzo
//
//  Created by Alexander Rohrig on 11/12/20.
//

import SwiftUI

struct NationView: View {
    
    @ObservedObject var fetch = FetchCurrent()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Currently Positive:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.positive ?? 0)")
                }
            }
            HStack{
                Text("Currently Hospitalized:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.hospitalizedCurrently ?? 0)")
                }
            }
            HStack{
                Text("Currently in ICU:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.inIcuCurrently ?? 0)")
                }
            }
            HStack{
                Text("Currently on Ventilator:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.onVentilatorCurrently ?? 0)")
                }
            }
            Divider()
            HStack{
                Text("Increase in Positive Cases:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.positiveIncrease ?? 0)")
                }
            }
            HStack{
                Text("Increase in Hospitalizations:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.hospitalizedIncrease ?? 0)")
                }
            }
            HStack{
                Text("Increase in Deaths:")
                Spacer()
                if let x = fetch.currentData.first {
                    Text("\(x.deathIncrease ?? 0)")
                }
            }
            Divider()
            HStack {
                if let x = fetch.currentData.first {
                    Text("Updated \(x.dateChecked ?? "nil")")
                }
                Spacer()
                Button(action: {
                    fetch.getCurrent()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
            }
        }.padding().onAppear() {
            fetch.getCurrent()
        }
    }
}

struct NationView_Previews: PreviewProvider {
    static var previews: some View {
        NationView()
    }
}
