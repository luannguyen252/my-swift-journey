//
//  UnderstandingTheSomeKeywordSolution.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 12/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct UnderstandingTheSomeKeywordSolution: View {
    var isYellow = true
    
    // The keyword "some" tells us that whatever we return, it has to:
    // 1. Conform to the View protocol
    // 2. Has to ALWAYS be the same type of View that is returned.
    
    var body: some View {

        if isYellow {
            return Color.yellow
        }
        
        return Color.clear
    }
}

struct UnderstandingTheSomeKeywordSolution_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingTheSomeKeywordSolution()
    }
}
