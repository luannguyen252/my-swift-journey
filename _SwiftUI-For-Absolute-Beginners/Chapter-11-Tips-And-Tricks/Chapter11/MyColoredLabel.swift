//
//  MyColoredLabel.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct MyColoredLabel: View {
    let colors:[Color] = [.red, .green, .blue, .orange, .purple, .gray]
    @State private var counter = 0
    let timer = Timer.publish(every: 0.5, on: .current, in: .common).autoconnect()
    
    var body: some View {
        Text("Hello, World! \(counter)")
            .background(colors.randomElement() ?? .blue)
            .onReceive(timer){ _ in
                self.counter += 1
        }
    }
    
    
}

struct MyColoredLabel_Previews: PreviewProvider {
    static var previews: some View {
        MyColoredLabel()
    }
}
