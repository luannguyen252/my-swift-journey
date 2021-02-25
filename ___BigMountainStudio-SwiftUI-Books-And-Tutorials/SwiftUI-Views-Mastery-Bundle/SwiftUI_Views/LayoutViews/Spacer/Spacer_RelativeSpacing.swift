//
//  Spacer_RelativeSpacing.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spacer_RelativeSpacing: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Spacer").font(.largeTitle)
            Text("Relative Spacing").foregroundColor(.gray)
            Text("You can add more spacers to create relative spacing in comparison to other spacers.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.yellow).foregroundColor(.black)
            HStack(spacing: 50) {
                VStack(spacing: 5) {
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Text("33% Down")
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                }
                VStack(spacing: 5) {
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Text("75% Down")
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                }
            }
        }.font(.title)
    }
}

struct Spacer_RelativeSpacing_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_RelativeSpacing()
    }
}
