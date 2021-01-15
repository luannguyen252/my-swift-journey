//
//  StateExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/19.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

// State 같은 경우, 문자열이나 정수와 같은 간단한 로컬 속성을 사용함.
struct StateExample: View {
    @State var score = 0
    var body: some View {
        VStack {
            Button(action: {
                self.score += 1
            }) {
                Text("Increase Score")
            }
            Text("score \(score)")
        }
    }
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
