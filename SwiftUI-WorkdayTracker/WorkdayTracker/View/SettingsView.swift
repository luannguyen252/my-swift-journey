//
//  SettingsView.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import SwiftUI
import CoreLocation
import MapKit

struct SettingsView: View {
    
    @EnvironmentObject var trackerModel: TrackerModel
    @State private var addressTxt = ""
    
    var body: some View {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                Spacer()
                HStack{
                    Spacer()
                    Label("Office Address:", systemImage: "building")
                    Spacer()
                    TextField("Tel Aviv..", text: $addressTxt)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        Text("Search")
                    }
                    Spacer()
                }
                Spacer()
                Map(coordinateRegion: $trackerModel.coordinateRegion)
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
