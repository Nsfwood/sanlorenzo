//
//  CovidProjectMachine.swift
//  sanlorenzo
//
//  Created by Alexander Rohrig on 11/12/20.
//

import Foundation
import Combine

//
// https://api.covidtracking.com/v1/states/tx/current.json
// https://api.covidtracking.com/v1/states/current.json
// https://api.covidtracking.com/v1/us/daily.json
//

struct StateCurrentResponse: Codable {
    let positive: Int?
    let positiveIncrease: Int?
    let lastUpdateEt: String?
}

struct NationCurrentResponse: Codable {
//    let date, states,
    let positive: Int?
        //, negative: Int?
//    let pending,
    let hospitalizedCurrently: Int?
        //, hospitalizedCumulative,
    let inIcuCurrently: Int?
//    let inIcuCumulative,
    let onVentilatorCurrently: Int?
        //, onVentilatorCumulative, recovered: Int?
    let dateChecked: String?
//    let death, hospitalized, totalTestResults: Int?
//    let lastModified: Date?
//    let total, posNeg,
    let deathIncrease, hospitalizedIncrease: Int?
    let positiveIncrease: Int?
//    let hash: String?
}

typealias CurrentResponseData = [NationCurrentResponse]

class FetchCurrent: ObservableObject {
    @Published var currentData = [NationCurrentResponse]()
    
    func getCurrent() {
        let url = URL(string: "https://api.covidtracking.com/v1/us/current.json")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let d = data {
                    let decodedData = try JSONDecoder().decode(CurrentResponseData.self, from: d)
                    DispatchQueue.main.async {
                        self.currentData = decodedData
                        print(decodedData)
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}

class FetchCurrentStateData: ObservableObject {
    @Published var currentStateData: StateCurrentResponse!
    
    func getCurrentState(state: String) {
        let url = URL(string: "https://api.covidtracking.com/v1/states/\(state)/current.json")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let d = data {
                    let decodedData = try JSONDecoder().decode(StateCurrentResponse.self, from: d)
                    DispatchQueue.main.async {
                        self.currentStateData = decodedData
                        print(decodedData)
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
