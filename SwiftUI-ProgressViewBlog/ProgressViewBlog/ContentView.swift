//
//  ContentView.swift
//  ProgressViewBlog
//
//  Created by Thomas Prezioso on 9/13/20.
//

import SwiftUI

struct ContentView: View {
    @State var isProgressViewHidden = false
    @State var progressBar = ProgressView("Loading...")
    
    var body: some View {
        Button(action: {
            self.isProgressViewHidden.toggle()
        }) {
            if isProgressViewHidden {
                VStack {
                    Text("Hide Progress View")
                    progressBar
                    
                }
            } else {
                Text("Show Progress View")
                
            }
        }
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
