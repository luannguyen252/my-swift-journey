//
//  SegmentedPickerView.swift
//  SwiftUIElements
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct SegmentedPickerView: View {
    
    @Binding var currentCornerRadius: Int
    let cornerRadiuses: [Int]
    
    var body: some View {
        Picker(selection: $currentCornerRadius, label: Text("")) {
            ForEach(cornerRadiuses, id: \.self) { cornerRadius in
                Text("\(cornerRadius)")
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView(currentCornerRadius: .constant(0), cornerRadiuses: [])
    }
}
