//
//  TimerExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/19.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct TimerExample: View {
    @State var timeRemaining = 10
   let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
    }
}

struct TimerExample_Previews: PreviewProvider {
    static var previews: some View {
        TimerExample()
    }
}
