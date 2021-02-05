//
//  RatingView.swift
//  BookWorm
//
//  Created by Sandesh on 11/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty { Text(label) }
            ForEach(1..<maximumRating + 1) { number in
                   self.image(for: number)
                       .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                       .onTapGesture { self.rating = number }
               }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
