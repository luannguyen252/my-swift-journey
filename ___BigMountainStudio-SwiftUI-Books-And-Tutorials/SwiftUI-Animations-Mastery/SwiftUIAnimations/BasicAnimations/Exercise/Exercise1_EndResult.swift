//
//  OffsetAndOpacity.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise1_EndResult: View {
    @State private var change = false
    var offsetValue: CGFloat = 200
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("End Result")
            BannerText("This is the final animation that you will be building.", backColor: .red, textColor: .white)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -offsetValue)
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -offsetValue)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : offsetValue)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : offsetValue)
                }.offset(x: 18)
            }
            .rotationEffect(Angle.degrees(change ? 0 : -90))
            .foregroundColor(change ? .red : .orange)
                .opacity(change ? 1 : 0)
            .animation(.default)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Exercise1_EndResult_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_EndResult()
    }
}
