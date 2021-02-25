//
//  Text_BaselineOffset.swift
//  100Views
//
//  Created by Mark Moeykens on 6/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_BaselineOffset : View {
    var body: some View {
        VStack(spacing: 20) {
            Image("BaselineOffset")
            HeaderView("Text",
                       subtitle: "Baseline Offset",
                       desc: "By default, your combined text will be on the same baseline, like this:", back: .green, textColor: .white)
                .font(.title)
                .layoutPriority(1)
            
            Text("100")
                + Text(" SWIFTUI ").font(.largeTitle).fontWeight(.light)
                .foregroundColor(.blue)
                + Text ("VIEWS")
            
            DescView(desc: "But you can offset each text view to create a cooler effect, like this:", back: .green, textColor: .white)
                .font(.title)
            
            Group {
                Text("100").bold()
                    + Text(" SWIFTUI ")
                    .font(Font.system(size: 60))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.blue)
                    .baselineOffset(-12) // Negative numbers make it go down
                    + Text ("VIEWS").bold()
            }
        }
    }
}

struct Text_BaselineOffset_Previews : PreviewProvider {
    static var previews: some View {
        Text_BaselineOffset()
    }
}
