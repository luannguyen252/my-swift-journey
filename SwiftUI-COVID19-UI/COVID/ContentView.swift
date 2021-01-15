//
//  ContentView.swift
//  COVID
//
//  Created by APPLE  on 18/05/20.
//  Copyright © 2020 Suresh Mopidevi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            customNavBar()
            ScrollView(.vertical) {
                topCardView()
                mainContent()
                takeTestCard()
                Spacer()
            }
        }
    }

    func customNavBar() -> some View {
        return ZStack {
            Rectangle()
                .frame(height: 56)
                .foregroundColor(Color("topCardBackgroundColor"))
            HStack(alignment: .center, spacing: 12.0) {
                Image("hambburger")
                    .resizable()
                    .frame(width: 24, height: 16)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
                Image("profileIcon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }.padding([.leading, .trailing], 20)
        }
    }

    func topCardView() -> some View {
        return ZStack {
            Rectangle()
                .foregroundColor(Color("topCardBackgroundColor"))
                .cornerRadius(28, corners: [.bottomLeft, .bottomRight])
            HStack(alignment: .top) {
                VStack {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("COVID-19")
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .padding([.top], 20)
                            .foregroundColor(/*@START_MENU_TOKEN@*/ .white/*@END_MENU_TOKEN@*/)

                        Text("Symptoms")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Text("People may be sick with the virus for 1 to 14 days before developing symptoms")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer()
                Image("Symptoms")
                    .resizable()
                    .frame(width: 130.0, height: 129.0)
                    .clipped()
            }.padding([.leading, .bottom, .trailing], 16)
        }
    }

    func mainContent() -> some View {
        return VStack(alignment: .leading) {
            Text("Prevention")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            HStack(alignment: .top) {
                iconGrid(title: "Stay at home", icon: "stayHome")
                iconGrid(title: "Keep a safe distance", icon: "keepSafeDistance")
                iconGrid(title: "Wash your hands often", icon: "washHands")
            }

            HStack(alignment: .top) {
                iconGrid(title: "Cover coughs and sneezes", icon: "coverCough")
                iconGrid(title: "Wear facemask if you are sick", icon: "wearFaceMask")
                iconGrid(title: "Clean and disinfect", icon: "clean")
            }
        }.padding()
    }

    let iconGridData: [(icon: String, title: String)] = []

    func iconGrid(title: String, icon: String) -> some View {
        return
            VStack(alignment: .center) {
                Image(icon)
                    .resizable()
                    .frame(width: 56, height: 56)
                Text(title)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
            }.inExpandingRectangle()
    }
    
    func takeTestCard() -> some View {
        return ZStack {
            Rectangle()
                .foregroundColor(.yellow)
                .cornerRadius(/*@START_MENU_TOKEN@*/16.0/*@END_MENU_TOKEN@*/)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Need to test COVID-19")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    Text("There are laboratory tests that identify the virus that COVID-19 in respiratory specimens.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }
                .padding([.top, .leading, .bottom], 16.0)
                .buttonStyle(/*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)
               
                Image("docWithCoronaIcons")
                .resizable()
                .frame(width:120,height: 178)
                    .padding([.bottom], -36)
                
            }
            .padding(.trailing)
            
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
