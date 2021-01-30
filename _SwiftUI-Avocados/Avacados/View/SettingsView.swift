//
//  SettingsView.swift
//  Avacados
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isNotificationEnabled: Bool = true
    @State private var backGroundRefresh: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                 Image("avocado")
                    .resizable().scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparantLight"), radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form {
                //MARK:- Section #1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $isNotificationEnabled) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backGroundRefresh) {
                        Text("Bcakground refresh")
                    }
                }
                
                //MARK:- Section #2
                
                Section(header: Text("Application")) {
                    if isNotificationEnabled {
                        HStack {
                            Text("Product").foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        
                        HStack {
                            Text("Compatibility").foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        
                        HStack {
                            Text("Developer").foregroundColor(.gray)
                            Spacer()
                            Text("Sandesh Naik")
                        }
                        
                        HStack {
                            Text("Designer").foregroundColor(.gray)
                            Spacer()
                            Text("Sandesh Naik")
                        }
                        
                        HStack {
                            Text("Website").foregroundColor(.gray)
                            Spacer()
                            Text("www.devsandesh.com")
                        }
                        
                        HStack {
                            Text("Version").foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal Message").foregroundColor(.gray)
                            Spacer()
                            Text("Happy Coding!")
                        }
                    }
                    
                    
                    
                    
                }
            }
        }
        .frame(maxWidth: 640)
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
