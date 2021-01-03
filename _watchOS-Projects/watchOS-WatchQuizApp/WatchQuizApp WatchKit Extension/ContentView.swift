//
//  ContentView.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 10/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let dataSource = DataSource()
    
    var body: some View {
        VStack {
            Text("Ready to play?")
            NavigationLink(destination: CategoriesList(dataSource: dataSource)) {
                Text("Start")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
