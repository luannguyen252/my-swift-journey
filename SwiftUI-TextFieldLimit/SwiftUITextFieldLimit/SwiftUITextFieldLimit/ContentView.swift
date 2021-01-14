//
//  ContentView.swift
//  SwiftUITextFieldLimit
//
//  Created by ProgrammingWithSwift on 2020/06/06.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

class TextLimiter: ObservableObject {
    private let limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
    
    @Published var value = "" {
        didSet {
            if value.count > self.limit {
                value = String(value.prefix(self.limit))
                self.hasReachedLimit = true
            } else {
                self.hasReachedLimit = false
            }
        }
    }
    
    @Published var hasReachedLimit = false
}

struct ContentView: View {
    @ObservedObject var input = TextLimiter(limit: 5)
    
    var body: some View {
        TextField("Text Input",
            text: $input.value)
            .border(Color.red,
                    width: $input.hasReachedLimit.wrappedValue ? 1 : 0 )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
