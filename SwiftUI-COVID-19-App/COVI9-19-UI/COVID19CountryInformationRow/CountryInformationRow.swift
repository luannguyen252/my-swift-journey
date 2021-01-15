//
//  COVID19CountryInformationRow.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 26/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import SwiftUI
import COVID_19_API_watchOS

struct COVID19CountryInformationRow: View {
    
    let country: SCMPCountry
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(country.name).fontWeight(.heavy)
            
            CountryStatisticView(imageName: "Healthcare-Skull-icon", statValue: country.deaths)
            CountryStatisticView(imageName: "cross-green", statValue: country.recovered)
            
        }.padding(.all, 10).background(Color(red: 51/255, green: 51/255, blue: 51/255)).cornerRadius(10)
//        .frame(height: 50, alignment: .center)
        
    }
    
}

struct CountryInformationRow_Previews: PreviewProvider {
    static var previews: some View {
        COVID19CountryInformationRow(country: .random())
    }
}
