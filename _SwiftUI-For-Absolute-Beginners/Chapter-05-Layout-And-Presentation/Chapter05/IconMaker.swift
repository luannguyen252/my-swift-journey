//
//  IconMaker.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct IconMaker: View {
    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
        .resizable()
        .frame(width: 250, height: 250)
        .padding()
            .foregroundColor(Color.white)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.orange]),
                startPoint: .top,
                endPoint: .bottom))
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct IconMaker_Previews: PreviewProvider {
    static var previews: some View {
        IconMaker()
    }
}
