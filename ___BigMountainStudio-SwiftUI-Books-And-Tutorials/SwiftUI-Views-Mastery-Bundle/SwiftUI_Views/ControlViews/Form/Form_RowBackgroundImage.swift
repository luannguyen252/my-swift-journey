//
//  Form_RowBackgroundImage.swift
//  100Views
//
//  Created by Mark Moeykens on 6/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Form_RowBackgroundImage : View {
    var body: some View {
        Form {
            Section(header: Text("Form")
                .font(.largeTitle).bold()
                .foregroundColor(.white)) {
                    Text("List Row Background")
                        .font(.title)
                        .foregroundColor(.gray)
                    Text("Images work a little differently as you can see here.")
                    Text("The image is actually set on a row in the second section.")
            }
            
            Section(header: Text("Images")
                .font(.title)
                .foregroundColor(.white)) {
                    Text("An image is set as a background for the row below. This works fine for rows, but when you use an image on the section level, it is repeated for all rows.")
                    Text("The image is set on THIS row, but it extends past the bounds. It also hides the row below this one and goes under the previous rows.")
                        .foregroundColor(.white)
                        .foregroundColor(.white)
                        .listRowBackground(Image("water")
                            .blur(radius: 3))
                    Text("This row cannot be seen.")
            }
        }
    }
}

struct Form_RowBackgroundImage_Previews : PreviewProvider {
    static var previews: some View {
        Form_RowBackgroundImage()
    }
}
