//
//  RollTheDice.swift
//  RollTheDice
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct RollTheDice: View {
    // MARK: - BODY
    var body: some View {
        Text("Roll The Dice")
            .frame(width: 240, height: 75)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct RollTheDice_Previews: PreviewProvider {
    static var previews: some View {
        RollTheDice()
    }
}
#endif
