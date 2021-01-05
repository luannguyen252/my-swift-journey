//
//  ContentView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let entry: Entry
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: entry.category.image)
                Text(entry.category.name)
            }
            .padding([.top, .leading, .trailing])
            Text(entry.title)
                .font(.largeTitle)
                .padding(.leading)
            Text(entry.text)
                .padding(.all)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(entry: Entry(title: "Title", text: "Text", category: .personal))
    }
}
