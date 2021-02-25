//
//  Preview_SizeCategory.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Preview_SizeCategory: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Size Category (Accessibility Text Size)").foregroundColor(.gray)
            Text("For testing accessibility text size, set the sizeCategory property.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }.font(.title)
    }
}

struct Preview_SizeCategory_Previews: PreviewProvider {
    static var previews: some View {
        Preview_SizeCategory()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        /*
         Options:
         case accessibilityExtraExtraExtraLarge
         case accessibilityExtraExtraLarge
         case accessibilityExtraLarge
         case accessibilityLarge
         case accessibilityMedium
         case extraExtraExtraLarge
         case extraExtraLarge
         case extraLarge
         case extraSmall
         case large
         case medium
         case small
         */
    }
}
