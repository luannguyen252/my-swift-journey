//
//  DateFormatter+Extension.swift
//  GymOrNotGym
//
//  Created by Michael on 14/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

extension DateFormatter {
	
	static var shortDate: DateFormatter {
		
		let formatter = DateFormatter()
		
		formatter.dateFormat = "dd/MM/yyyy"
		
		return formatter
		
	}
	
}
