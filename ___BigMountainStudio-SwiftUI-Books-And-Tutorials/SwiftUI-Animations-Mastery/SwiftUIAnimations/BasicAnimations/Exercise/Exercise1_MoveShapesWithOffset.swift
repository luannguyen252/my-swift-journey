//
//  Exercise1_MoveShapesWithOffset.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise1_MoveShapesWithOffset: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("Move Shapes with Offset")
            BannerText("You need to offset each shape individually because they are all coming in from 4 different directions.", backColor: .red, textColor: .white)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -200) // Move left
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -200) // Move up
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : 200) // Move down
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : 200) // Move right
                }.offset(x: 18)
            }
            .rotationEffect(.degrees(change ? 0 : -90))
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

struct Exercise1_MoveShapesWithOffset_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_MoveShapesWithOffset()
    }
}
