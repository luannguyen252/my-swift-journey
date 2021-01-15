//
//  ToggleView.swift
//  SwiftUIElements
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var showSliders: Bool
    
    var body: some View {
        Toggle(isOn: $showSliders) {
            Text("Show sliders ")
        }.fixedSize()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(showSliders: .constant(false))
    }
}
