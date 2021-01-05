//
//  OtherDetails.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/5/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

/// Other weather details embedded in ScrollView view.
struct OtherDetails: View {
    //    @ObservedObject var weatherData = TemperaturaViewModel()
    @EnvironmentObject var weatherData: WeatherViewModel
    @State var showList: Bool = false
    @State var showGrid: Bool = true
    
    var body: some View {
        ZStack {
            Color.init(#colorLiteral(red: 0.9672107618, green: 0.9672107618, blue: 0.9672107618, alpha: 1))
            //            Color.init(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            VStack {
                HStack(alignment: .center) {
                    Text("Weather Details")
                        .font(.headline)
                    Spacer()
                    HStack(spacing: 16.0) {
                        Button(action: { self.showGrid = true; self.showList = false }) {
                            Image(systemName: "rectangle.grid.2x2")
                                .font(.system(size: 24, weight: .light))
                        }
                        .foregroundColor(self.showGrid ? Color.blue : Color.secondary)
                        
                        Button(action: { self.showList = true; self.showGrid = false }) {
                            Image(systemName: "list.dash")
                                .font(.system(size: 24, weight: .light))
                        }
                        .foregroundColor(showList ? Color.blue : Color.secondary)
                    }
                }.padding()
                
                if showGrid {
                    /// Show the grid view when grid view option is selected.
                    GridView()
                } else {
                    /// Show the list view when the list view option is selected.
                    ListView()
                }
            }
        }
    }
}

struct OtherDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OtherDetails().environmentObject(WeatherViewModel())
            OtherDetails().previewLayout(.fixed(width: 700, height: 323)).environmentObject(WeatherViewModel())
        }
    }
}
