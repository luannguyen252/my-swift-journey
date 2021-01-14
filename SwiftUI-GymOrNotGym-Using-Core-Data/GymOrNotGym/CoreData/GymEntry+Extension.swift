//
//  GymEntry+Extension.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import CoreData

extension GymEntry {
	
	var formattedDate: String {
		
		guard let date = date else {
			return ""
		}
		
		return DateFormatter.shortDate.string(from: date)
		
	}
	
}

//MARK: FetchRequest factory function

extension GymEntry {
	
	public class func makeSortedFetchRequest() -> NSFetchRequest<GymEntry> {
		
		let fetchRequest = NSFetchRequest<GymEntry>(entityName: String(describing: GymEntry.self))
		let sortDescriptor = NSSortDescriptor(keyPath: \GymEntry.date, ascending: false)
		
		fetchRequest.sortDescriptors = [sortDescriptor]
		
		return fetchRequest
		
	}
	
}
