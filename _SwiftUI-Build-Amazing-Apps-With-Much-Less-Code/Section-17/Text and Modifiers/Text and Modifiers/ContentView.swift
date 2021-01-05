//
//  ContentView.swift
//  Text and Modifiers
//
//  Created by Stephen DeStefano on 9/6/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .font(.custom("courier", size: 30))
                .fontWeight(.thin)
                .bold()
                .italic()
                .baselineOffset(4)
                .kerning(2)
                .underline(true, color: Color.green)
            //.strikethrough(true, color: .red)
            //.flipsForRightToLeftLayoutDirection(true)
            
            Divider()
            Spacer()
            
            Text("This is a really really really really really long string that will span multiple lines in the preview. Peter Piper picked a peck of pickled peppers.")
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                //.padding(20)
                .lineLimit(2)
                .lineSpacing(1)
                .allowsTightening(true)
                .truncationMode(.tail)
                .padding(EdgeInsets(top: 100, leading: 10, bottom: 100, trailing: 10))
                .overlay(Text("Some overlayed text!"), alignment: .bottomLeading)
                .overlay(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.1)))
                .border(Color.red, width: 4)
            
            Spacer()
            
            Text("Hello SwiftUI")
                .foregroundColor(.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.orange, .yellow, .red, .blue, .purple, .black]), startPoint: .leading, endPoint: .trailing))
            
            Spacer()
            
            Text("SwiftUI")
                .font(.largeTitle)
                .foregroundColor(Color.red)
//                .background(Image("mountain")
//                .resizable()
//                .frame(width: 200, height: 150))
                .padding(30)
                //.background(Color.init(hue: 0.3, saturation: 1.2, brightness: 0.7, opacity: 0.7))
            .background(RoundedRectangle(cornerRadius: 50))
        }
        
    }
}

let appleSite = "https://apple.com"

struct ContentView2: View {
var body: some View {
    VStack {
        
        Text("SwiftUI Rocks")
            .font(.callout)
            .foregroundColor(.white)
            .frame(width: 150, height: 150)
            .background(Circle())
            .padding(50)
        
        Text("SwiftUI is fun and easy")
        .bold()
            .fontWeight(.medium)
            .foregroundColor(.red)
            .font(.largeTitle)
            .shadow(color: .black, radius: 1, x: 0, y: 2)
            .padding(50)
        
        Text(appleSite)
            .underline(color: Color.black)
            .font(.system(size: 24, design: .serif))
            .onTapGesture {
                //put your code that you want to execute here
                print("URL link has been tapped")
        }
             .padding(40)
        
        Text("Clip me")
            .font(.largeTitle)
            .background(Rectangle().fill(Color.orange)
            .frame(width: 300, height: 100))
            .clipped()
       }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView2()
        }
    }
}
