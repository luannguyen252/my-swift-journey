//
//  ColorTriangle.swift
//  PixelKit SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI
import PixelKit

struct ColorTriangle: View {
    var body: some View {
        LumaColorShiftPIX(hue: 0.5) {
            LumaBlurPIX(radius: 0.25) {
                PolygonPIX()
            } with: {
                GradientPIX()
                    .pixContrast(3.0)
            }
            .pixMultiply(color: .red)
        } with: {
            GradientPIX()
                .pixContrast(3.0)
        }
        .ignoresSafeArea()
    }
}

struct ColorTriangle_Previews: PreviewProvider {
    static var previews: some View {
        ColorTriangle()
            .overlay(PlayPreviews())
    }
}
