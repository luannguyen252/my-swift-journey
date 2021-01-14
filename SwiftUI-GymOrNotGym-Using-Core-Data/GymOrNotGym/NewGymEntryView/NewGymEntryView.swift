//
//  NewGymEntryView.swift
//  GymOrNotGym
//
//  Created by Michael on 10/10/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import SwiftUI

struct NewGymEntryView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject var viewModel = NewGymEntryViewModel()
	
    var body: some View {
					
		VStack {
					
			Spacer()

			Image($viewModel.attended.wrappedValue ? "Runner" : "Sitting").resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch).scaledToFit().frame(height: 300, alignment: .center)
			
			Spacer()
			
			HStack(alignment: .center, spacing: 30) {
				
				Button(action: {
					
					self.viewModel.attended = true
					
				}) {
					
					Text("I Did Go")
					
				}
				Button(action: {
					
					self.viewModel.attended = false
					
				}) {
					
					Text("I Didn't Go")
					
				}
				
			}.frame(height: 100, alignment: .center)
										
		}.navigationBarTitle("New Entry").navigationBarItems(trailing:
			
			Button(action: {
			
				self.viewModel.addEntry {
					
					self.presentationMode.wrappedValue.dismiss()
					
				}
				
			}, label: {
				
				Text("Save")
				
			})
			
		)
		
    }
	
}

struct NewGymEntry_Previews: PreviewProvider {
	
    static var previews: some View {
		
		NavigationView {
			
			NewGymEntryView()
			
		}
		
    }
	
}
