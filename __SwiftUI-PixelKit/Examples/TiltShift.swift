//
//  TiltShift.swift
//  PixelKit with SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI
import PixelKit

struct TiltShift: View {
    var body: some View {
        LumaBlurPIX(radius: 0.1) {
            ImagePIX(named: "City")
                .pixTranslate(y: 0.1)
                .pixExtend(.mirror)
                .pixScaleResolution(placement: .fill)
        } with: {
            GradientPIX(direction: .vertical,
                        colorSteps: [
                            ColorStop(0.0, .white),
                            ColorStop(0.5, .black),
                            ColorStop(1.0, .white),
                        ])
        }
        .ignoresSafeArea()
    }
}

struct TiltShift_Previews: PreviewProvider {
    static var previews: some View {
        TiltShift()
            .overlay(PlayPreviews())
    }
}
