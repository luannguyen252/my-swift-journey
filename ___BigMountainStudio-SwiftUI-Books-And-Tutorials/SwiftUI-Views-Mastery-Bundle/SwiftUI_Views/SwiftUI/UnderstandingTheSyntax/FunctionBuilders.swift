//
//  FunctionBuilders.swift
//  100Views
//
//  Created by Mark Moeykens on 8/7/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct FunctionBuilders: View {
    // Missing code here
    var body: some View {
        VStack(content: {
            Text("Hello World!")
            Text("This Vertical Stack is using a function builder")
        })
    }
}

#if DEBUG
struct FunctionBuilders_Previews: PreviewProvider {
    static var previews: some View {
        FunctionBuilders()
    }
}
#endif
