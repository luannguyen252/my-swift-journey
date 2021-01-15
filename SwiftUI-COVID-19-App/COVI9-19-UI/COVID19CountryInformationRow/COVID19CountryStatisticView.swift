//
//  COVID19CountryStatisticView.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 26/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import SwiftUI

struct COVID19CountryStatisticView: View {
    
    var imageName: String
    var statValue: Int
    
    var body: some View {
        
        HStack {
            
            Image(imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 40, alignment: .leading)
            
            Spacer()
            
            Text(NumberFormatter.decimal.string(from: NSNumber(value: statValue))!).fontWeight(.bold)
            
        }
        
    }
    
}

struct CountryInformationStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        COVID19CountryStatisticView(imageName: "cross-green", statValue: 10000)
    }
}
