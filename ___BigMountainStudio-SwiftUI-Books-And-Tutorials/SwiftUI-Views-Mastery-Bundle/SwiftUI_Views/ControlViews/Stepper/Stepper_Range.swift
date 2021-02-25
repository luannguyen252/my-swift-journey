//
//  Stepper_Customization.swift
//  100Views
//
//  Created by Mark Moeykens on 6/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Stepper_Range : View {
    @State private var stars = 5
    
    fileprivate func showStars(index: Int) -> Image {
        return Image(systemName: "star.fill")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
                .padding()
            Text("Range of Values")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can set a range for the stepper too. In this example, the range is between one and five.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            
            Stepper(value: $stars, in: 1...5) {
                Text("Rating")
            }.padding(.horizontal)
            
            HStack {
                ForEach(1...stars, id: \.self) { star in
                    Image(systemName: "star.fill")
                }
            }
            .font(.title)
            .foregroundColor(.yellow)
        }
    }
}

struct Stepper_Range_Preview : PreviewProvider {
    static var previews: some View {
        Stepper_Range()
    }
}
