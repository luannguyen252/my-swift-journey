//
//  ContentView.swift
//  FlipCard
//
//  Created by Leonardo Bilia on 6/30/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct ContentView : View {

    var body: some View {
        
        NavigationView {
            GiftCardView()
                .padding()
                
            .navigationBarTitle(Text("Gift Shop"))
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
