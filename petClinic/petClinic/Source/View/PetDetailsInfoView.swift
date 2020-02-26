//
//  PetDetailsInfoView.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/26.
//  Copyright © 2020 Tejas. All rights reserved.
//

import SwiftUI

struct PetDetailsInfoView: View {
    let petInfo: Pet
    var body: some View {
        WebView(request: URLRequest(url: URL(string: petInfo.content_url)!))
            .navigationBarTitle(Text(petInfo.title), displayMode: .inline)
    }
}
