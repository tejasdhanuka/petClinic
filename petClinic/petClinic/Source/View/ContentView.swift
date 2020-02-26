//
//  ContentView.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        NavigationView {
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
                .padding(.top, 20)
                
                Text("Office Hours: M-F 10:00 - 18:00")
                    .frame(height: 44)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                List(networkingManager.petsList.results, id: \.title) { pet in
                    NavigationLink(destination: PetDetailsInfoView()) {
                        PetRow(pet: pet)
                    }
                }
                
            }
            .navigationBarTitle(Text("Pet Clinic"), displayMode: .inline)
        }
    }
}


struct PetRow: View {
    let pet: Pet
    
    var body: some View {
        HStack {
            ImageViewWidget(imageUrl: pet.image_url)
                .padding(.trailing, 20.0)
            Text(pet.title)
        }
    }
}

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

struct ImageViewWidget: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "apple")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .frame(width: 100, height: 100)
            .border(Color.black)
    }
}


struct PetDetailsInfoView: View {
    var body: some View {
        Text("ABC")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
