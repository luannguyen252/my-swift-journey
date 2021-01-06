//
//  SectionUnitView.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 14/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct SectionUnitView: View {
    
    @Binding var unit: MainUnit
    
    var body: some View {
        Section(header: Text("Units").font(.headline)) {
            HStack {
                Picker(selection: $unit, label: Text("")) {
                    ForEach(MainUnit.allCases) { (unit: MainUnit) in
                        Text(unit.description)
                            .tag(unit)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 100)
            }
        }
    }
}
