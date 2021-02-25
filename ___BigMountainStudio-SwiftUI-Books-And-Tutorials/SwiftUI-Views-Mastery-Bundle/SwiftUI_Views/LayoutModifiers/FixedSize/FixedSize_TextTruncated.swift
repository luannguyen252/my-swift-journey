//
//  FixedSize_TextTruncated.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/11/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct FixedSize_TextTruncated: View {
	var body: some View {
		VStack(spacing: 10) {
			Text("Fixed Size").font(.largeTitle)
			Text("Prevent Text Truncating").foregroundColor(.gray)
			Text("Use the fixedSize modifier to prevent text from truncating when layoutPriority won't work.")
				.frame(maxWidth: .infinity)
				.padding()
				.background(Color.yellow)
				.foregroundColor(.black)
			Form {
				Section(header: Text("Text in a Form").font(.largeTitle)) {
					Text("Sometimes you get text that truncates like this:")
					
					Text("This text goes on for too long and will eventually get truncated if you don't use the fixedSize modifier.")
						.listRowBackground(Color.pink)
						.layoutPriority(1) // Does not show truncated text
					
					Text("This text goes on for too long and will eventually get truncated if you don't use the fixedSize modifier.")
						.listRowBackground(Color.green)
						.fixedSize(horizontal: false, vertical: true) // Use fixed size to expand the text vertically in this situation.
				}
			}
		}
        .font(.title)
    
	}
}

struct FixedSize_TextTruncated_Previews: PreviewProvider {
	static var previews: some View {
		FixedSize_TextTruncated()
	}
}
