//
//  ColorData.swift
//  ColorConverter
//
//  Created by Benni on 24.09.19.
//  Copyright © 2019 Benni. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorData {

	var red = Double.random(in: 0...1)
	var green = Double.random(in: 0...1)
	var blue = Double.random(in: 0...1)

	var hexString: String {
		set {
			updateRGBValues(from: newValue)
		}
		get {
			String(format:"%02X", Int(red * 255.0)) + String(format:"%02X", Int(green * 255.0)) + String(format:"%02X", Int(blue * 255.0))
		}
	}

	private mutating func updateRGBValues(from hex: String) {
		guard validateHexString(hex) else { return }

		let scanner = Scanner(string: hex)
		var color: UInt64 = 0
		scanner.scanHexInt64(&color)
		let mask = 0x000000FF

		red = Double(Int(color >> 16) & mask)
		green = Double(Int(color >> 8) & mask)
		blue = Double(Int(color) & mask)
	}

	private func validateHexString(_ hex: String) -> Bool {
		guard hex.count == 6 else { return false }
		let chars = CharacterSet(charactersIn: "0123456789ABCDEF")
		guard hex.uppercased().rangeOfCharacter(from: chars) != nil else {
		   return false
		}

		return true
	}

}

