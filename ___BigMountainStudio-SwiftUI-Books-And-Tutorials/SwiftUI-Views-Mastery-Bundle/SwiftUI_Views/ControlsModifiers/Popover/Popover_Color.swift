//
//  Popover_Color.swift
//  100Views
//
//  Created by Mark Moeykens on 8/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popover_Color: View {
    @State private var showPopover = false
    @State private var articleName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Popover").font(.largeTitle)
            Text("Colors").foregroundColor(.gray)
            Text("You can add color to the Popover but be warned, as of this writing, the arrow will still use the system color. Look closely and you will see the arrow color is not changed.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue).foregroundColor(.white)
            HStack {
                Text("Article Name")
                TextField("Enter Your Article Name", text: $articleName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.showPopover = true
                }, label: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title).foregroundColor(.yellow)
                }).popover(isPresented: $showPopover) {
                    ZStack {
                        Color.blue // Popover's background color
                        Text("The article name must be greater than 5 characters.")
                            .foregroundColor(.white).font(.title)
                    }
                }
            }.padding()
            Spacer()
        }.padding(.top).font(.title)
    }
}

struct Popover_Color_Previews: PreviewProvider {
    static var previews: some View {
        Popover_Color()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}
