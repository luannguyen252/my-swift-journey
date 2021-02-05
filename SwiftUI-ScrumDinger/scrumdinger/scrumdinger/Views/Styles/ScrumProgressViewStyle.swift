//
//  ScrumProgressViewStyle.swift
//  scrumdinger
//
//  Created by An Trinh on 24/12/20.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    var scrumColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .frame(height: 12.0)
            .accentColor(scrumColor)
    }
}
