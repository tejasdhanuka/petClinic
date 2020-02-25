//
//  PetsModel.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/25.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation

struct PetsList : Decodable {
    var results: [Pet]
}

struct Pet: Decodable {
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String
}
