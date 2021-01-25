//
//  Texts.swift
//  ColorConverter
//
//  Created by Benni on 02.10.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import Foundation
import SwiftUI


struct Title: View {
	let title: String
	var body: some View {
		Text(title)
			.font(.largeTitle)
			.fontWeight(.heavy)
			.foregroundColor(.primary)
			.multilineTextAlignment(.trailing)
	}
}

struct Title_Previews: PreviewProvider {
	
    static var previews: some View {
		Title(title: "Title")
    }
}


struct Subtitle: View {
	let subtitle: String
	var body: some View {
		Text(subtitle)
			.font(.title)
			.fontWeight(.medium)
			.foregroundColor(.secondary)
	}
}

struct Subtitle_Previews: PreviewProvider {
	
    static var previews: some View {
		Subtitle(subtitle: "Subtitle")
    }
}
