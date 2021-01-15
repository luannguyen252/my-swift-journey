//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by ibrahim oktay on 18.07.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotated = false
    
    var body: some View {
        VStack {
            Button("Rotate") {
                self.isRotated.toggle()
            }
            Spacer()
            ForEach(0..<6) { index in
                RectangleView(isRotated: $isRotated, index: index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
