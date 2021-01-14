//
//  AppsView.swift
//  TabBarTutorial
//
//  Created by Alpar Matyas on 10/09/2019.
//  Copyright © 2019 Alpar Matyas. All rights reserved.
//

import SwiftUI

struct AppsView: View {
    
    @State var animation = true
    
    var body: some View {
        VStack {
            Text("Rebeloper Messages")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 10)
                .scaleEffect(animation ? 0.5 : 1)
                .rotation3DEffect(Angle(degrees: animation ? 0 : 360), axis: (x: 0, y: 360, z: 0))
                .animation(Animation.easeInOut(duration: 3).repeatForever())
                .onAppear{ self.animation.toggle() }
            
        }.padding(.horizontal, 20)
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}
