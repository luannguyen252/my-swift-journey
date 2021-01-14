//
//  ContentView.swift
//  GettingStartedSwiftUI
//
//  Created by Umer Khan on 20/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(User.users, id: \.id) { user in
                        NavigationLink(destination: VisitorInfoView(user: user)) {
                            CardView(user: user)
                                .padding(.vertical)
                        }
                    }
                }
            }.navigationBarTitle(Text("Quick Card"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
