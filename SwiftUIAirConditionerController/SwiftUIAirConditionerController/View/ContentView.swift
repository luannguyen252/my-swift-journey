//
//  ContentView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State var temperature: Int = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            
            // Circular Wheel
            CircularRular(temperature: $temperature)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(alignment: .lastTextBaseline, spacing: 0) {
                            Text("Panasonic")
                                .font(.title)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .fontWeight(.heavy)
                            
                            Text("Air")
                                .font(.title)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .fontWeight(.light)
                        }
                        
                        Text("Air Conditioner Controller")
                            .font(.title3)
                            .foregroundColor(colorScheme == .dark ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                            .fontWeight(.regular)
                    }
                    .padding()
                    
                    
                    Spacer()
                    
                    Button(action: {
                        print("Button Pressed!")
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundColor(colorScheme == .dark ? Color.gray : Color.white)
                            .padding()
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        // Temperature Value Text
                        TemperatureView(temperature: $temperature)
                        
                        // Smart Schedule
                        SmartScheduleView()
                            .padding(.top, 80)
                        
                        // Mode Selection View
                        ModeSelectionView()
                            .padding(.top, 16)
                        
                        // Fan Speed Slider
                        FanSpeedView()
                            .padding(.vertical, 40)
                            .padding(.trailing, 40)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 32)
                    
                    Spacer()
                }
                
                PowerView()
            }
            .padding(.top, 40)
            .padding(.bottom, 32)
            .frame(width: UIScreen.screens.first?.bounds.width, height: UIScreen.screens.first?.bounds.height)
            
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
