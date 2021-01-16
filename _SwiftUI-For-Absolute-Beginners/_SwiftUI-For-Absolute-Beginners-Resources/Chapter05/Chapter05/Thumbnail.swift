//
//  Thumbnail.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Thumbnail: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("cheesecake")
            .resizable()
            .frame(width: 350, height: 250)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(15)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 350, height: 35)
                .opacity(0.3)
                .blur(radius: 10)
            Text("Baked Cheesecake")
            .font(.title)
            .bold()
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct Cheesecake_Previews: PreviewProvider {
    static var previews: some View {
        Thumbnail()
    }
}
