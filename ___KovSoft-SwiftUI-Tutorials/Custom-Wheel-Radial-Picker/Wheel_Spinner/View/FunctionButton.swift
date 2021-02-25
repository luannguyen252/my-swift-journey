//
//  FunctionButton.swift
//  Wheel_Spinner
//
//  Created by Balaji on 25/09/20.
//

import SwiftUI

struct FunctionButton: View {
    var image: String
    var angle : Double
    @State var circleWidth = UIScreen.main.bounds.width / 1.5
    @Binding var current : Int
    var index : Int
    
    var body: some View {
        
        Image(systemName: image)
            .font(.system(size: 24, weight: .heavy))
            .foregroundColor(.black)
            //here.....
            .rotationEffect(.init(degrees: -angle))
            .padding()
            .background(Color.red.opacity(current == index ?  0.5 : 0))
            .clipShape(Circle())
            .offset(x: -circleWidth / 2)
            // this will rotate image...
            // so we undo its image rotation in...
            .rotationEffect(.init(degrees: angle))
    }
}

