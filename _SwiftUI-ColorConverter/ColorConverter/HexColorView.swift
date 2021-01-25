//
//  HexColorView.swift
//  ColorConverter
//
//  Created by Benni on 24.09.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import SwiftUI


struct HexColorView: View {
	@Binding var hexString: String

	var body: some View {
		
		VStack(alignment: .leading, spacing: 4.0) {
			Title(title: "Hex")

			HStack {
				Text("#")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(.secondary)

				TextField("Hex Hex", text: $hexString)
					.font(.largeTitle)
					.foregroundColor(.primary)
					.textFieldStyle(PlainTextFieldStyle())
			}
		}
	}
}


struct HexColorView_Previews: PreviewProvider {
	
    static var previews: some View {
		HexColorView(hexString: .constant(""))
    }
}

