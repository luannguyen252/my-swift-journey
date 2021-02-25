//
//  WelcomeView.swift
//  Cybertruck
//
//  Created by Anik on 31/8/20.
//

import SwiftUI

struct WelcomeView: View {
    @State var toggleStatus = true
    @State var selection: Int? = nil
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                NavigationLink(
                    destination: DashboardView()
                        .navigationTitle("")
                        .navigationBarHidden(true),
                    tag: 1,
                    selection: $selection,
                    label: {
                        Button(action: {
                            self.selection = 1
                        }, label: {
                            Image(systemName: "gearshape")
                        })
                        .buttonStyle(DarkButtonStyle())
                    })
            }
            .padding(.top, 44)
            .padding(.trailing, 25)
            
            Group {
                Text("Tesla")
                    .font(.system(size: 24))
                    .foregroundColor(.buttonTintColor)
                Text("Cybertruck")
                    .font(.system(size: 45, weight: .black))
                    .foregroundColor(.textPrimary)
            }
            
            ZStack {
                HStack(alignment: .top) {
                    Text("297")
                        .font(.system(size: 170, weight: .ultraLight))
                        .foregroundColor(.textPrimary)
                    Text("km")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.textPrimary)
                        .offset(y: 28)
                }
                
                Image("cyber_truck")
                    .resizable()
                    .scaledToFit()
                    .offset(y: 120)
            }
            .offset(y: -20)
            
            Spacer()
            
            Group {
                Text("A/C is turned on")
                    .font(.system(size: 24))
                    .foregroundColor(.buttonTintColor)
                    .padding(.bottom, 20)
                
                Toggle(isOn: $toggleStatus, label: {
                    Image("lock")
                })
                .toggleStyle(CustomToggleStyle(diameter: 140))
                
                Text(toggleStatus ? "Tap to open the car" : "Car is open")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.textPrimary)
                    .padding(.bottom, 34)
            }
        }
    }
}
