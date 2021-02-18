//
//  Monochrome.swift
//  PixelKit with SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI
import PixelKit

struct Monochrome: View {
    var body: some View {
        ImagePIX(named: "Kite")
            .pixScaleResolution(placement: .fill)
            .pixSaturation(0.0)
            .ignoresSafeArea()
    }
}

struct Monochrome_Previews: PreviewProvider {
    static var previews: some View {
        Monochrome()
            .overlay(PlayPreviews())
    }
}
