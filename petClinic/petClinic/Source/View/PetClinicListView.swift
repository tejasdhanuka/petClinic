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

struct PetClinicListView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    @ObservedObject var configuration = Configuration()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if configuration.config.isChatEnabled ?? true {
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
                    } else {
                        EmptyView()
                    }
                    
                    if configuration.config.isCallEnabled ?? true {
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
                    } else {
                        EmptyView()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 20)
                
                Text("Office Hours: \(configuration.config.workHours)")
                    .frame(height: 44)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                List(networkingManager.petsList.results, id: \.title) { pet in
                    NavigationLink(destination: PetDetailsInfoView(petInfo: pet)) {
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

