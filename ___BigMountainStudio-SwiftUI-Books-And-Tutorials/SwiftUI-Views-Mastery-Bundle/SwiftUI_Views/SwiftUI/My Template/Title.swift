//
//  Title.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Title") // Create text on the screen
            .font(.largeTitle) // Use a font modifier to make text larger
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
