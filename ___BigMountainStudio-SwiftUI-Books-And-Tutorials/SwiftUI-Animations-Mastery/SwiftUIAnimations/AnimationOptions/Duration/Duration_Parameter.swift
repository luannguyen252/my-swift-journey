//
//  DurationParameter.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Duration_Parameter: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animation Options")
            SubtitleText("Duration Parameter")
            BannerText("To set a duration, you need to turn the animation type into a function. Like .easeInOut into .easeInOut(duration: 1).", backColor: .purple, textColor: .white)
            
            Text("Duration: Default")
            Image(systemName: "hare.fill")
                .foregroundColor(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut) // Default duration
            
            Text("Duration: 2 Seconds")
            Image(systemName: "tortoise.fill")
                .foregroundColor(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut(duration: 2)) // Two seconds
            
            Button("Change") {
                self.change.toggle()
            }
            
            BannerText("Note: The default animation duration in SwiftUI is less than a second. Somewhere around 0.4 seconds.", backColor: .purple, textColor: .white)
        }.font(.title)
    }
}

struct Duration_Parameter_Previews: PreviewProvider {
    static var previews: some View {
        Duration_Parameter()
    }
}
