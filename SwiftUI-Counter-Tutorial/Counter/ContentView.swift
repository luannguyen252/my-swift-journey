//
//  ContentView.swift
//  Counter
//
//  Created by Swapnanil Dhol on 8/10/19.
//  Copyright © 2019 Swapnanil Dhol. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var count : Int = 0
    var body: some View {
        VStack {
            Text("\(self.count)")
                .font(Font.system(size: 30))
            Button(action: {self.count = self.count + 1}) {
                Text("Click me")
                    .font(.headline)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
