//
//  ActivityIndicator.swift
//  SwiftUICustomProgressBars
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct ActivityIndicator: View {
    // MARK: - PROPERTIES
    @State var degress = 0.0
    
    // MARK: - BODY
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(darkBlue, lineWidth: 5.0)
            .frame(width: 120, height: 120)
            .rotationEffect(Angle(degrees: degress))
            .onAppear(perform: {self.start()})
    }
    
    // MARK: - SET START
    func start() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}

// MARK: - PREVIEW
struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}

// MARK: - SET COLORS
let darkBlue = Color(#colorLiteral(red: 0, green: 0.1873417795, blue: 0.848551631, alpha: 1))
let lightGrey = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
