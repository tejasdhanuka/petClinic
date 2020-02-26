//
//  ImageLoaderUtility.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/26.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    var objectWillChange = ObservableObjectPublisher()
    
    var data = Data() {
        willSet {
            objectWillChange.send()
        }
    }
    
    init(imageUrl: String) {
        // fetch image data and then call didChange
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}
