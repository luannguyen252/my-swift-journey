//
//  CircularProgressBar.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

struct CircularProgressBar: View {
    
    let color: Color

    @State private var degrees = 0.0
    @State private var timer: Timer?
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5)
            .frame(width: 30, height: 30)
            .rotationEffect(Angle(degrees: degrees))
            .onAppear(perform: {
                self.start()
            })
            .onDisappear(perform: {
                self.stop()
            })
    }
    
    // Start updating the loading rotation
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degrees += 10
            }
        }
    }
    
    // Stop updating the loading rotation
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}


struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(color: .blue)
    }
}
