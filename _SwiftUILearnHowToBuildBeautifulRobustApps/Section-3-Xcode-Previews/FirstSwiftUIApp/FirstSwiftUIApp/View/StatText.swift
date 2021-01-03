//
//  StatText.swift
//  FirstSwiftUIApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct StatText: View {
    // MARK: - PROPERTIES
    var statName: String
    var statValue: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(statName + ":")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .padding(.leading, 30)
            
            Text(statValue)
                .font(.system(size: 45))
                .fontWeight(.light)
                .padding(.trailing, 30)
            
            Spacer()
        } //: HSTACK
        .minimumScaleFactor(0.6)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct StatText_Previews: PreviewProvider {
    static var previews: some View {
        StatText(statName: "Age", statValue: "55")
    }
}
#endif
