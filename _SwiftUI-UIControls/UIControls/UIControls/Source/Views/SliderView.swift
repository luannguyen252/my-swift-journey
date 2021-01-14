//
//  SliderView.swift
//  UIControls
//
//  Created by Sud on 6/19/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct SliderView : View {
    @State var value: Float = 0.0
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("\(value)")
                    Slider(value: $value)
                }
            }
        }
        .navigationBarTitle(Text("Slider"))
    }
}

#if DEBUG
struct SliderView_Previews : PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
#endif
