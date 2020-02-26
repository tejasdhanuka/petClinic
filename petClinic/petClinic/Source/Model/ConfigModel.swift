//
//  ConfigModel.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/26.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation
import Combine

struct Config {
    var isChatEnabled: Bool?
    var isCallEnabled: Bool?
    var workHours: String
}

class Configuration: ObservableObject {
//    var objectWillChange = ObservableObjectPublisher()
//
//      var config = Config(isChatEnabled: nil, isCallEnabled: nil, workHours: "") {
//          willSet {
//              objectWillChange.send()
//          }
//      }
    
    @Published var config = Config(isChatEnabled: nil, isCallEnabled: nil, workHours: "")
    
    func fetch() {
        guard let path = Bundle.main.path(forResource: "config", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
            
            guard let configDict = json as? [String: Any] else { return }
            guard let settingsDict = configDict["settings"] as? [String: Any] else { return }
            
            guard let chatEnabled = settingsDict["isChatEnabled"] as? Bool else { return }
            guard let callEnabled = settingsDict["isCallEnabled"] as? Bool else { return }
            guard let workHours = settingsDict["workHours"] as? String else { return }
            
            config = Config(isChatEnabled: chatEnabled, isCallEnabled: callEnabled, workHours: workHours)
        }
        catch {
            print(error)
            return
        }
    }
}
