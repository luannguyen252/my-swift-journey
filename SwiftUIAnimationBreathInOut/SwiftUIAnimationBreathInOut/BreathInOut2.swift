//
//  BreathInOut2.swift
//  SwiftUIAnimationBreathInOut
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct BreathInOut2: View {
    // MARK: - PROPERTIES
    @State var breath: Bool = false
    @State var textChange: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            ZStack {
                ZStack {
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    } //: ZSTACK
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    } //: ZSTACK
                } //: ZSTACK
                .opacity(0.5)
                
                ZStack {
                    ZStack {
                        RadialGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    } //: ZSTACK
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors:  [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    } //: ZSTACK
                } //: ZSTACK
                .opacity(0.5).rotationEffect(Angle(degrees: 60), anchor: .center)
                
                ZStack {
                    ZStack {
                        RadialGradient(gradient: Gradient(colors:  [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 100)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: -41.0)
                    } //: ZSTACK
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors:  [Color.pink, Color.purple]), center: .center, startRadius: 5, endRadius: 90)
                            .clipShape(Circle()).frame(width: 80, height: 80)
                            .offset(y: 41.0)
                    } //: ZSTACK
                } //: ZSTACK
                .opacity(0.5).rotationEffect(Angle(degrees: 60 * 2), anchor: .center)
            } //: ZSTACK
            .rotationEffect(Angle.degrees(breath ? 360 : 0))
            .scaleEffect(breath ? 2.0 : 0.2)
            .animation(Animation.easeOut(duration: 4).delay(1.0).repeatForever())
            .opacity(breath ? 1.0 : 0.5)
            .onAppear() { self.breath.toggle() }
            
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.pink)
                .scaleEffect(breath ? 0.6 : 1.4)
                .opacity(breath ? 0 : 1)
                .blendMode(.hardLight)
                .animation(Animation.easeOut(duration: 4).delay(1.0).repeatForever())
         } //: ZSTACK
    } //: ZSTACK
}

// MARK: - PREVIEW
#if DEBUG
struct BreathInOut2_Previews: PreviewProvider {
    static var previews: some View {
        BreathInOut2()
    }
}
#endif
