//
//  ArchiveView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ArchiveView: View {
    // MARK: - PROPERTIES
    @State var isAnimated = false
    let width: CGFloat
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: isAnimated ? 0.7 : 0.0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(270))
                .frame(width: 200)
                .animation(.easeInOut)
                .onAppear() {
                    self.isAnimated.toggle()
            }
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView(width: 375)
    }
}
#endif
