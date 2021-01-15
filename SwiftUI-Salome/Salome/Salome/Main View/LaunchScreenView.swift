//
//  LaunchScreenView.swift
//  Salome
//
//  Created by App Designer2 on 04.10.20.
//

import SwiftUI

struct MaingLaunchScreenView: View {
    @State var launchScreen : Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.init(UIColor.black))
                .edgesIgnoringSafeArea(.all)
            //withAnimation(Animation.linear) {
        VStack {
            if self.launchScreen {
                VStack {
                Indicator()
                }
            } else {
                ContentView()
            }
        
        }
            //}.animation(Animation.linear)
        }
        .onAppear {
            self.launchScreen = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                self.launchScreen = false
            }
        }
    }
}

struct MaingLaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MaingLaunchScreenView()
    }
}
