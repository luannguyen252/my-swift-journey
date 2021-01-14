//
//  BarView.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import SwiftUI

struct BarView: View {
    
    var color = Color.clear
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    var label: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                .frame(width: width, height: height)
                .cornerRadius(12)
            Text(label)
                .font(.footnote)
                .rotationEffect(Angle(degrees: -75))
                .offset(y: 15)
                .animation(nil)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(color: .red, width: 30, height: 50, label: "Events")
    }
}
