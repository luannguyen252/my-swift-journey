//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_TwoScreens_Namespaces_Problem: View {
    @State private var showGreenScreen = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Two Views - Namespaces")
                BannerText("The two matched views have to share the same namespace. How do you do this with views in two different places?", backColor: .green, textColor: .black)
                
                if showGreenScreen == false {
                    Circle()
                        .fill(Color.green)
                        .overlay(Text("Start"))
                        .matchedGeometryEffect(id: "twoScreens", in: namespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture { showGreenScreen.toggle() }
                }
                Spacer()
            }
            
            if showGreenScreen {
                MGE_GreenScreen(showGreenScreen: $showGreenScreen)
            }
        }
        .font(.title)
        .animation(.easeIn)
    }
}

struct MGE_TwoScreens_Namespaces_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_TwoScreens_Namespaces_Problem()
    }
}

struct MGE_GreenScreen: View {
    @Binding var showGreenScreen: Bool
    @Namespace var namespace
    
    var body: some View {
        Color.green
            .ignoresSafeArea()
            .overlay(Text("Stop"))
            .matchedGeometryEffect(id: "twoScreens", in: namespace)
            .onTapGesture { showGreenScreen.toggle() }
    }
}
