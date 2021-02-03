//
//  ContentView.swift
//  SwiftUI21
//
//  Created by Rohit Saini on 27/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var percent: CGFloat = 0
    var body: some View {
        VStack{
            Loader(percent: percent).padding(20)
            HStack{
                Button(action: {
                    self.percent = 30
                }) {
                    Text("30%").foregroundColor(.black).fontWeight(.heavy)
                    
                }
                Button(action: {
                    self.percent = 70
                }) {
                    Text("70%").foregroundColor(.black).fontWeight(.heavy)
                }
                Button(action: {
                    self.percent = 100
                }) {
                    Text("100%").foregroundColor(.black).fontWeight(.heavy)
                }
                
                Button(action: {
                    self.percent = 0
                }) {
                    Text("0%").foregroundColor(.black).fontWeight(.heavy)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loader:View{
    var percent: CGFloat = 0
    var colors: [Color] = [.red,.orange,.green,.yellow,.purple,.black,.pink]
    var body: some View{
        ZStack{
            
            Circle()
            .fill(Color.white)
            .frame(width: 150, height: 150)
            .overlay(
            Circle()
            .trim(from: 0, to: percent * 0.01)
            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            )
            .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
            Text(String(format: "%.1f", percent) + " %").foregroundColor(.gray).fontWeight(.heavy)
        }
    }
}
