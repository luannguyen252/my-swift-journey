//
//  Trigger_ScrollLocation.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Trigger_ScrollLocation: View {
    var colors: [Color] = [.green, .blue, .red, .purple, .pink, .orange, .yellow]

    var body: some View {
        VStack(spacing: 10) {
            TitleText("Trigger")
            SubtitleText("ScrollView")
            BannerText("Although no animation modifier is used, the ScrollView is changing values (locations of views) that you can use to modify views. Here is a parallax effect as an example:", backColor: .green)
            
            ScrollView {
                ZStack {
                    GeometryReader { gp in
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // By modifying the Y offset while scrolling you can change the scroll speed
                            .offset(y: -gp.frame(in: .global).origin.y / 2)
                    }
                    
                    VStack(spacing: 40) {
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                    }
                    .padding(40)
                }.edgesIgnoringSafeArea(.vertical)
            }
        }.font(.title)
    }
}

struct Trigger_ScrollLocation_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_ScrollLocation()
    }
}
