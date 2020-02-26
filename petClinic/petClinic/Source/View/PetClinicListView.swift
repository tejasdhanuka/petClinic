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
    @State var showAlert = false
    @ObservedObject var configuation = Configuration()
    
    var body: some View {
        NavigationView {
            VStack {
                ContactButtonsView(config: configuation.config, showAlert: $showAlert)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.top, 20)
                
                Text("Office Hours: \(configuation.config.workHours)")
                    .frame(height: 44)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                
                PetListView(networkingManager: networkingManager)
            }
            .navigationBarTitle(Text("Pet Clinic"), displayMode: .inline)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Date().isTimeWithinWorkHours() ? Text("Thank you for getting in touch with us") : Text("Work hours has ended"),
                  message: Date().isTimeWithinWorkHours() ? Text("We’ll get back to you as soon as possible") : Text("Please contact us again on the next work day"),
                  dismissButton: .default(Text("OK")))
        }
        .onAppear {
            self.configuation.fetch()
        }
    }
}

struct ContactButtonsView: View {
    let config: Config
    @Binding var showAlert: Bool

    var body: some View {
        HStack {
            if config.isChatEnabled ?? true {
                Button(action: {
                    self.showAlert = true
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
            
            if config.isCallEnabled ?? true {
                Button(action: {
                    self.showAlert = true
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
    }
}

struct PetListView: View {
    let networkingManager: NetworkingManager

    var body: some View {
        List(networkingManager.petsList.results, id: \.title) { pet in
            NavigationLink(destination: PetDetailsInfoView(petInfo: pet)) {
                PetRow(pet: pet)
            }
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
