//
//  SimpleProgressBar.swift
//  SwiftUICustomProgressBars
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct SimpleProgressBar: View {
    // MARK: - PROPERTIES
    @Binding var circleProgress: CGFloat
    
    var width: CGFloat
    var height: CGFloat
    var progressColor: Color?
    var staticColor: Color?

    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(self.staticColor ?? .gray)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(self.progressColor ?? .blue)
                    .frame(width: self.circleProgress*geometry.size.width, height: geometry.size.height)
            }
        }
        .frame(width: width, height: height)
    }

}

// MARK: - PREVIEW
struct SimpleProgresBar_Previews: PreviewProvider {
    static var previews: some View {
        SimpleProgressBar(circleProgress: .constant(0.2), width: 200, height: 10, progressColor: .blue, staticColor: .gray)
    }
}
