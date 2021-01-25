//
//  ContentView.swift
//  ColorConverter
//
//  Created by Benni on 24.09.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	// Model color data, defined as @State, so the view reloads everytime the color data is changed.
	@State var colorData = ColorData()

	var body: some View {
		// NavigationView for showing a nav bar and title
		NavigationView {
			// ScrollView for giving some dynamics to the interface
			ScrollView {
				// The VStack houses the main interface components
				VStack(spacing: 24.0) {
					HexColorView(hexString: $colorData.hexString)

					Divider()

					ColorSliderView(colorValue: $colorData.red, title: "Rot").accentColor(.red)
					ColorSliderView(colorValue: $colorData.green, title: "Grün").accentColor(.green)
					ColorSliderView(colorValue: $colorData.blue, title: "Blau").accentColor(.blue)

					Divider()

                    ColorView(color: $colorData)
				}
				.padding()
				.navigationBarTitle("Color Converter", displayMode: .inline)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	
    static var previews: some View {
		ContentView()
    }
}


