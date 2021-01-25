//
//  ContentView.swift
//  AnimationChartWithSwiftUI
//
//  Created by park kyung suk on 2020/06/15.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 1
    
    //[segment][graph]
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [50, 180, 70, 100, 160],
        [100, 180, 60, 80, 120],
    ]
    
    var body: some View {
        
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
            
                 Text("Hello, World!")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("textColor"))
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack (spacing: 16) {
                    BarChart(value: dataPoints[pickerSelectedItem][0], dayTitle: "Sun")
                    BarChart(value: dataPoints[pickerSelectedItem][1], dayTitle: "Mon")
                    BarChart(value: dataPoints[pickerSelectedItem][2], dayTitle: "Tue")
                    BarChart(value: dataPoints[pickerSelectedItem][3], dayTitle: "Wed")
                    BarChart(value: dataPoints[pickerSelectedItem][4], dayTitle: "Thu")
                    BarChart(value: dataPoints[pickerSelectedItem][3], dayTitle: "Fri")
                    BarChart(value: dataPoints[pickerSelectedItem][4], dayTitle: "Sat")
                }.padding(.top, 24)
                    .animation(.default)
                
            }
        }
        
    }
}

struct BarChart: View {
    
    var value: CGFloat = 0
    var dayTitle: String = ""
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.4881172776, green: 0.9120940566, blue: 0.6927334666, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(dayTitle).padding(.top, 8)
            .foregroundColor(Color("textColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
