//
//  ContentView.swift
//  SwiftUI-FullModal
//
//  Created by Klemen Košir on 11/04/2020.
//  Copyright © 2020 Klemen Košir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var isPresented: Bool = false
	
	var body: some View {
		NavigationView {
			Button(action: {
				self.isPresented.toggle()
			}) {
				Text("Present")
			}
			.navigationBarTitle("Some title")
		}
		.present($isPresented, view: ModalView(isPresented: $isPresented))
	}
}

struct ModalView: View {
	
	@Binding var isPresented: Bool
	
	var body: some View {
		ZStack {
			Color.white
				.edgesIgnoringSafeArea(.all)
			Button(action: {
				self.isPresented.toggle()
			}) {
				Text("Dismiss")
			}
		}
	}
}




struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
