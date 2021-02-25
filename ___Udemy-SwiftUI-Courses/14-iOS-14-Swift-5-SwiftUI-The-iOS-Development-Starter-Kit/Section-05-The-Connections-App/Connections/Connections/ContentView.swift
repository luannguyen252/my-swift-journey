//
//  ContentView.swift
//  Connections
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Divider().rotationEffect(.degrees(30))
            Divider().rotationEffect(.degrees(90))
            Divider().rotationEffect(.degrees(-30))
            
            ConnectionView(imageName: "yourname")
            
            HStack {
                ConnectionView(imageName: "monica")
                    .rotationEffect(.degrees(-30))
                Spacer()
                ConnectionView(imageName: "ross")
                    .rotationEffect(.degrees(-30))
            }   .rotationEffect(.degrees(30))
            
            HStack {
                ConnectionView(imageName: "joey")
                    .rotationEffect(.degrees(-90))
                Spacer()
                ConnectionView(imageName: "chandler")
                    .rotationEffect(.degrees(-90))
            }   .rotationEffect(.degrees(90))
            
            HStack {
                ConnectionView(imageName: "rachel")
                    .rotationEffect(.degrees(30))
                Spacer()
                ConnectionView(imageName: "phoebe")
                    .rotationEffect(.degrees(30))
            }   .rotationEffect(.degrees(-30))
            
        }   .frame(width: 300, height: 300)
    }
}
