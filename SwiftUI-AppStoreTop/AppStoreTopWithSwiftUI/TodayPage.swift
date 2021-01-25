//
//  TodayPage.swift
//  AppStoreTopWithSwiftUI
//
//  Created by park kyung suk on 2020/06/27.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct TodayPageView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text("wednessday, April 15")
                            .foregroundColor(.gray).bold()
                        Text("Today").font(.largeTitle).bold()
                    }
                    Spacer()
                    Button(action: self.loadProfile, label: {
                        Image("profile").resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                    })
                    
                }.padding([.leading, .trailing, .top])
            }.padding()
            HighlightView(category: "Surfing", title: "Just Take off!", message: "Let's do that take off").frame(height: 500, alignment: .leading)
            
            HighlightView(category: "Surfing", title: "Just Take off!", message: "Let's do that take off").frame(height: 500, alignment: .leading)
            
            HighlightView(category: "Surfing", title: "Just Take off!", message: "Let's do that take off").frame(height: 500, alignment: .leading)
        }
    }
    
    func loadProfile() {
        
    }
}

struct HighlightView: View {
    
    var category: String
    var title: String
    var message: String
    
    var body: some View {
        VStack {
            ZStack {
                Image("surfing").resizable()
                    .scaledToFit()
                LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                
                VStack (alignment: .leading) {
                    Text(category).foregroundColor(.white).bold()
                    Text(title).foregroundColor(.white).font(.title).bold()
                    Spacer()
                    Text(message).foregroundColor(.white).bold()
                }.padding()
                
            }
            
        }.cornerRadius(30).padding().shadow(radius: 4)
    }
}

struct TodayPageView_Previews: PreviewProvider {
    static var previews: some View {
        TodayPageView()
    }
}

