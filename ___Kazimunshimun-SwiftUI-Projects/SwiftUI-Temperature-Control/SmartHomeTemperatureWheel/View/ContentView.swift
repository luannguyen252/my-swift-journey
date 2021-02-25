//
//  ContentView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 13/9/20.
//

import SwiftUI

struct ContentView: View {
    @State var temperature: Int = 0
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            
            //Circular wheel
            CircularRular(temperature: $temperature)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        //temperature value text
                        TemperatureView(temperature: $temperature)
                        //smart schedule
                        SmartScheduleView()
                            .padding(.top, 80)
                        //mode selection view
                        ModeSelectionView()
                            .padding(.top, 20)
                        //fan speed slider
                        FanSpeedView()
                            .padding(.vertical, 40)
                            .padding(.trailing, 40)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 30)
                    
                    Spacer()
                }
                
                PowerView()
            }
            .padding(.top, 44)
            .padding(.bottom, 34)
            .frame(width: UIScreen.screens.first?.bounds.width, height: UIScreen.screens.first?.bounds.height)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
