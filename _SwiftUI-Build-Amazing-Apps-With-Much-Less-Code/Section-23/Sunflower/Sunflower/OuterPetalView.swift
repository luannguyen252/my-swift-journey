//
//  OuterPetalView.swift
//  Sunflower
//
//  Created by Stephen DeStefano on 9/11/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct OuterPetalView: View {
    
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }
                    
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }.rotationEffect(.degrees(60))
                    
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }.rotationEffect(.degrees(120))
                    
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }.rotationEffect(.degrees(90))
                    
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }.rotationEffect(.degrees(30))
                    
                    ZStack {
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .bottom, endPoint: .top))
                            .frame(width: 30, height: 150)
                            .offset(y: 120)
                        
                        Ellipse().fill(LinearGradient(gradient: Gradient(colors: [settings.changePetalColor ? .purple : .yellow, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 30, height: 150)
                            .offset(y: -120)
                    }.rotationEffect(.degrees(-30))
                    
                }.rotationEffect(.degrees(rotateInOut ? 90 : 0))
                    .scaleEffect(scaleInOut ? 1 : 1/8)
                    .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(settings.animationSpeed))
                    .onAppear() {
                      if self.settings.isToggleOn {
                        self.rotateInOut.toggle()
                        self.scaleInOut.toggle()
                        self.moveInOut.toggle()
                        }
                }
                
                Spacer()
            }
        }
    }
}












struct OuterPetalView_Previews: PreviewProvider {
    static var previews: some View {
        OuterPetalView().environmentObject(UserSettings())
    }
}
