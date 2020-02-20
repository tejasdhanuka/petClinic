//
//  ContentView.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Chat")
                        .font(.body)
                        .padding()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                })
                    .background(Color.blue)
                    .cornerRadius(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal, 10)
                
                Button(action: {
                    
                }, label: {
                    Text("Call")
                        .font(.body)
                        .padding()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                })
                    .background(Color.green)
                    .cornerRadius(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal, 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            Text("Office Hours: M-F 10:00 - 18:00")
                .frame(height: 44)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
