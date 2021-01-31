//
//  Home.swift
//  SwiftUIGameUI
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    print("Button Pressed!")
                }) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(data) { i in
                        Card(data: i)
                    }
                }
                .padding(.bottom)
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}
