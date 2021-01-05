//
//  ContentView.swift
//  Stacks
//
//  Created by Stephen DeStefano on 9/13/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Hi, i'm child one in this vertical stack")
            Text("Hi, i'm child two in this vertical stack")
            Text("Hi, i'm child three in this vertical stack")
            Text("Hi, i'm child four in this vertical stack, i'm the best!")
            
            Divider()
            
            Text("Hi, i'm child one in this vertical stack")
            Text("Hi, i'm child two in this vertical stack")
            Text("Hi, i'm child three in this vertical stack")
            Text("Hi, i'm child four in this vertical stack, i'm the best!")
        }.padding().offset(x: 30, y: 300)
            .padding(.leading, 50)
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
         ZStack {
              Image("swiftui-icon")
                .resizable()
                .frame(width: 360, height: 360)
            
            Text("SwiftUI").offset(x: 0, y: 125)
                .font(.system(size: 60))
                .foregroundColor(.white)
          }
            HStack {
                Image("swiftui-icon")
                .resizable()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading) {
                    Text("Build Better Apps")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("With less code using Apple's new design tool - SwiftUI")
                }
            }
            
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
