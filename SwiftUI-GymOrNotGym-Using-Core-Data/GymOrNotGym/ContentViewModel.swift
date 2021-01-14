//
//  ContentViewModel.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation
import CoreData
import Combine

class ContentViewModel: NSObject, ObservableObject {
	
	var fetchedResultsController: NSFetchedResultsController<GymEntry>
	var entriesSubject: CurrentValueSubject<[GymEntry], Never>
	
	init(_ managedObjectContext: NSManagedObjectContext) {
		
		fetchedResultsController = NSFetchedResultsController(fetchRequest: GymEntry.makeSortedFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
		entriesSubject = CurrentValueSubject<[GymEntry], Never>([])
		
		super.init()
		
		fetchedResultsController.delegate = self
		
		do {
			
			try fetchedResultsController.performFetch()
			
			entriesSubject.send(fetchedResultsController.fetchedObjects ?? [])
			
		} catch {
		
			print(error)
			
		}
		
	}
	
}

//MARK: NSFetchedResultsControllerDelegate
extension ContentViewModel: NSFetchedResultsControllerDelegate {
	
	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		
		guard let entries = controller.fetchedObjects as? [GymEntry] else {
			return
		}
		
		entriesSubject.send(entries)
		
	}
	
}
