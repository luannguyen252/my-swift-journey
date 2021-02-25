//
//  Curve_ExtractTitleView.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Workout Pro")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top, 40)
            Spacer()
        }
    }
}

struct Curve_ExtractTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
