//
//  NetworkManager.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/25.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager : ObservableObject {
    var objectWillChange = ObservableObjectPublisher()
    
    var petsList = PetsList(results: []) {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        guard let url = URL(string: "https://api.myjson.com/bins/1ahji4") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let petsList = try! JSONDecoder().decode(PetsList.self, from: data)
            
            DispatchQueue.main.async {
                self.petsList = petsList
            }
        }.resume()
    }
}
