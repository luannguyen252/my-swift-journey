//
//  COVID19CountryInformationRow.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 26/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import SwiftUI
import COVID_19_API

struct COVID19CountryInformationRow: View {
    
    let country: SCMPCountry
    #if os(watchOS)
    let backgroundColor = Color(red: 51/255, green: 51/255, blue: 51/255)
    #else
    let backgroundColor = Color("Total Background")
    #endif
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(country.name).fontWeight(.heavy)
            #if os(watchOS)
                COVID19CountryStatisticView(imageName: "Healthcare-Skull-icon", statValue: country.deaths)
                COVID19CountryStatisticView(imageName: "cross-green", statValue: country.recovered)
            #else
                HStack {
                    COVID19CountryStatisticView(imageName: "Healthcare-Skull-icon", statValue: country.deaths)
                    COVID19CountryStatisticView(imageName: "cross-green", statValue: country.recovered)
                }
            #endif
            
        }.padding(.all, 10).background(backgroundColor).cornerRadius(10)
        
    }
    
}

struct CountryInformationRow_Previews: PreviewProvider {
    static var previews: some View {
        COVID19CountryInformationRow(country: .random())
    }
}
