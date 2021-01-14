//
//  ContentView.swift
//  codeTutorial_contextMenu
//
//  Created by Christopher Guirguis on 4/8/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        Text("PRESS HARD - \(counter)")
            .contextMenu{
                VStack{
                    Button(action: {
                        self.counter += 1
                    }) {
                        Text("+1")
                    }
                    Button(action: {
                        print("Cancelling")
                    }) {
                        Text("Cancel")
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
