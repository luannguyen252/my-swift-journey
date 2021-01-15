//
//  GlobalDataRow.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct GlobalDataRow: View {
    let globalData: CovidStates
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            StateView(header: "Confirmed", value: globalData.confirmed.value)
            Spacer()
            StateView(header: "Deaths", value: globalData.deaths.value)
            Spacer()
            StateView(header: "Recovered", value: globalData.recovered.value)
            Spacer()
        }
    }
}

struct StateView: View {
    let header: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(verbatim: value)
                .font(.headline)
            Text(verbatim: header)
                .font(.subheadline)
        }
    }
}
