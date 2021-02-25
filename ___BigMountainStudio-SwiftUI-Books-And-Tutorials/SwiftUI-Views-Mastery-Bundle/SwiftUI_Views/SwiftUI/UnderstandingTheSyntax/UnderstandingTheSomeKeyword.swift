//
//  UnderstandingSomeKeyword.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct UnderstandingTheSomeKeyword: View {
    var isYellow = true
    
    // The keyword "some" tells us that whatever we return, it has to:
    // 1. Conform to the View protocol
    // 2. Has to ALWAYS be the same type of View that is returned.
    
    var body: some View {
        // ERROR: Function declares an opaque return type, but the return statements in its body do not have matching underlying types
        if isYellow {
            return Color.yellow // Color type does not match the Text type
        }
        
        return Color.yellow //Text("No color yellow") // Text type does not match the color type
    }
}

struct UnderstandingTheSomeKeyword_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingTheSomeKeyword()
    }
}
