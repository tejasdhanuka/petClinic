//
//  WebView.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/26.
//  Copyright © 2020 Tejas. All rights reserved.
//

import SwiftUI
import WebKit

  
struct WebView : UIViewRepresentable {
    let request: URLRequest
      
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
      
}
