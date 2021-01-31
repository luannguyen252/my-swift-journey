//
//  IconsView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct IconsView: View {
    // MARK: - PROPERTIES
    @State var iconTapped = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            IconView(imageName: "icon1", animationDuration: 1.2)
                .offset(x: iconTapped ? 200 : 80) // 200 : 80
                .scaleEffect(iconTapped ? 0.7 : 0.8) // 0.7 : 0.8
                .rotation3DEffect(Angle(degrees: iconTapped ? 15 : 0), axis: (x: 5, y: 10, z: 0)) // 15 : 0
            
            IconView(imageName: "icon2", animationDuration: 0.7)
                .offset(x: iconTapped ? -200 : -80) // -200 : -80
                .scaleEffect(iconTapped ? 0.7 : 0.8) // 0.7 : 0.8
                .rotation3DEffect(Angle(degrees: iconTapped ? 15 : 0), axis: (x: -5, y: -10, z: 0)) // 15 : 0
            
            IconView(imageName: "icon3", animationDuration: 1)
                .offset(y: iconTapped ? -10 : 0) // -10 : 0
                .scaleEffect(iconTapped ? 1.2 : 1) // 1.2 : 1
                .onTapGesture {
                    self.iconTapped.toggle()
                }
                .padding(.horizontal, 20)
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
#endif
