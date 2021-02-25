//
//  ViewBuilderExample.swift
//  100Views
//
//  Created by Mark Moeykens on 8/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ViewBuilderExample: View {
    var body: some View {
        VStack {
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
            VStack { // The VStack is now the 10th view
                Text("View 10")
                Text("View 11")
            }
        }
    }
}

#if DEBUG
struct ViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderExample()
    }
}
#endif
