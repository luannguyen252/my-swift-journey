//
//  ContentView.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	@State var addEntryPresented: Bool = false
	@FetchRequest(fetchRequest: GymEntry.makeSortedFetchRequest(), animation: .default) var gymEntry: FetchedResults<GymEntry>
//	var contentViewModel: ContentViewModel
	
    var body: some View {
		
		VStack {
			
			List(gymEntry, id: \.self) { (gymEntry) -> GymCell in
				GymCell(gymEntry: gymEntry)
			}
			
//			List(contentViewModel.subject.value, id: \.self) { (gymEntry) -> GymCell in
//				GymCell(gymEntry: gymEntry)
//			}
			
			
		}.navigationBarTitle("Gym Entries").navigationBarItems(trailing:
			
			Button(action: {
				
				self.addEntryPresented = true
				
			}) {
				
				Text("New")
				
			}
			
		).sheet(isPresented: self.$addEntryPresented) {
			
			NavigationView {
				
				NewGymEntryView()
				
			}
			
		}
		
    }
	
}

struct ContentView_Previews: PreviewProvider {
	
    static var previews: some View {
		
		NavigationView {
//			ContentView(contentViewModel: ContentViewModel(CoreDataContainer.main.persistentContainer.viewContext))
			ContentView().environment(\.managedObjectContext, CoreDataContainer.main.persistentContainer.viewContext)
		}
		
    }
	
}
