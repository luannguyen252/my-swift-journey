//
//  ContentView.swift
//  Shared
//
//  Created by Rohit Saini on 13/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var rotationValue: Double = 0
    var body: some View {
        VStack{
            HStack{
                Circle().stroke(Color.purple,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 50, height: 50)
                
                Circle().stroke(Color.purple,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 50, height: 50)
            }.rotationEffect(.degrees(rotationValue),anchor: .center)
            HStack{
                Circle().stroke(Color.purple,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 50, height: 50)
                
                Circle().stroke(Color.purple,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 50, height: 50)
            }.rotationEffect(.degrees(rotationValue),anchor: .center)
        }
        .animation(Animation.linear(duration: 1).repeatForever())
        .onAppear(){
            rotationValue = -360
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
