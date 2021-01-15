//
//  ContentView.swift
//  RRSwiftUIAPICalling
//
//  Created by Rahul Mayani on 09/07/20.
//  Copyright © 2020 RR. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiObserved = APIObserver()
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        NavigationView{
            List(apiObserved.jokes){ i in
                    HStack{Text(i.joke)}
                }.navigationBarItems(
                    trailing: RRButton( getNewJoke,
                                       animationValue: $animationAmount)
                                       .onAppear {
                                           self.animationAmount = 2
                                       })
            .navigationBarTitle("SwiftUI API Calling")
        }
    }
    
    func getNewJoke(){
        apiObserved.getJokes(count: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
