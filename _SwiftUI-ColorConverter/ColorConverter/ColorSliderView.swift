//
//  ColorSliderView.swift
//  ColorConverter
//
//  Created by Benni on 24.09.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import SwiftUI



struct ColorSliderView: View {

	@Binding var colorValue: Double
	var title: String

	var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			HStack {
				Title(title: title)

				Spacer()

				Subtitle(subtitle: Formatter.twoDecimalPoints(from: colorValue / 255.0))
				Subtitle(subtitle: Formatter.wholeNumber(from: colorValue))
			}
			
			Slider(value: $colorValue, in: 0...1)
		}
	}
}


struct ColorSliderView_Previews: PreviewProvider {
	
    static var previews: some View {
		ColorSliderView(colorValue: .constant(0.3), title: "TEST")
    }
}
