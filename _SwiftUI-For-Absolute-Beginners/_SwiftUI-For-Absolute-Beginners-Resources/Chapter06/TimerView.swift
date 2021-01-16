//
//  TimerView.swift
//  Chapter06
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State private var counter = 0
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    var body: some View {
        Text("Counter Ticks: \(counter)")
            .onReceive(timer){ _ in
                self.counter += 1
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
