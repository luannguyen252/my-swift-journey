//
//  ContentView.swift
//  BarCharts
//
//  Created by Arlan on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 130, 40, 120],
        [150, 100, 50, 95, 24, 10],
        [100, 190, 30, 51, 128, 140]]
    var body: some View {
        ZStack{
            
            Color("appBack").edgesIgnoringSafeArea(.all)
            VStack{
                Text("Calory Intake")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker(selection: $pickerSelectedItem, label: Text("Picker"), content: {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }).pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 20){
                    BarView(value: dataPoints[pickerSelectedItem][0], text: "Mo")
                    BarView(value: dataPoints[pickerSelectedItem][1], text: "Tu")
                    BarView(value: dataPoints[pickerSelectedItem][2], text: "Wd")
                    BarView(value: dataPoints[pickerSelectedItem][3],text: "Th")
                    BarView(value: dataPoints[pickerSelectedItem][4], text: "Fr")
                    BarView(value: dataPoints[pickerSelectedItem][5], text: "WE")
                    
                }.padding(.top, 24)
                .animation(.default)
            }
            
        }
        
    }
}

struct BarView: View{
    
    var value: CGFloat
    
    var text: String
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.3541981043, green: 0.7905991946, blue: 0.647152136, alpha: 1)))
                Capsule().frame(width: 30, height: value, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
            Text(text).padding(.top, 10)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
