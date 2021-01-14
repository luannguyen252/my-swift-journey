//
//  GymCell.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import SwiftUI
import CoreData

struct GymCell: View {
	
	let gymEntry: GymEntry
	
    var body: some View {
		
		VStack(alignment: .leading, spacing: 5) {
			
			Text(gymEntry.attended ? "You went to the gym" : "You didn't go to the gym")
			Text(gymEntry.formattedDate).font(.caption)
			
		}.padding(5)
		
    }
	
}

struct GymCell_Previews: PreviewProvider {
	
	static let entry: GymEntry = {
		
		let entry = GymEntry(context: CoreDataContainer.main.persistentContainer.viewContext)
		
		entry.attended = true
		entry.date = Date()
		
		return entry
		
	}()
	
    static var previews: some View {
		
		GymCell(gymEntry: entry)
		
    }
	
}
