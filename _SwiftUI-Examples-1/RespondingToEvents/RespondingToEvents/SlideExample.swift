//
//  SlideExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/04.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct SlideExample: View {
    @State private var celsius:Double = 0
    var body: some View {
        VStack {
            Slider(value:$celsius, in: -100 ... 100, step:0.1)
            Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32)")
        }
    }
}

struct SlideExample_Previews: PreviewProvider {
    static var previews: some View {
        SlideExample()
    }
}
