//
//  ContentView.swift
//  arswiftui
//
//  Created by Romain on 04/02/2020.
//  Copyright © 2020 Romain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
		ARView()
			.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
