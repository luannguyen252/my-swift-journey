//
//  ContentView.swift
//  SimpleLoginSystem
//
//  Created by Gaspard Rosay on 27.01.20.
//  Copyright © 2020 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("lock")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 200.0, height: 200.0)
                .cornerRadius(90.0)
            Text("I am protected by a login page.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
