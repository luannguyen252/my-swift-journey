//
//  ZoomTextOnce.swift
//  Chapter06
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct ZoomTextOnce: View {
    @State private var startAnimation = false
    @State private var changeValue:CGFloat = 0.0
    
    var body: some View {
        Text("Hello World!")
        .scaleEffect(changeValue)
            .onAppear(){
            withAnimation {
                self.changeValue = 1.8
            }
        }
    }
}

struct ZoomTextOnce_Previews: PreviewProvider {
    static var previews: some View {
        ZoomTextOnce()
    }
}

