//
//  NewGymEntryViewModel.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

class NewGymEntryViewModel: ObservableObject {
	
	private unowned var coreData: CoreDataContainer
	
	@Published var attended: Bool = false
	
	init(coreData: CoreDataContainer = .main) {
		
		self.coreData = coreData
		
	}
	
}

extension NewGymEntryViewModel {
	
	func addEntry(completion: (()->())? = nil) {
				
		let backgroundContext = coreData.persistentContainer.newBackgroundContext()

		backgroundContext.performAndWait {

			let entry = GymEntry(context: backgroundContext)
			
			entry.attended = self.attended
			entry.date = Date()

			if backgroundContext.hasChanges {

				do {

					try backgroundContext.save()

					DispatchQueue.main.async {

						completion?()

					}

				} catch let error {

					print(error.localizedDescription)

				}

			}

		}
			
	}
	
}
