//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_TwoScreens_Namespaces_Solution: View {
    @State private var showGreenScreen = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                TitleText("MatchedGeometryEffect")
                SubtitleText("Two Views - Namespaces")
                BannerText("You have to pass in a reference to the namespace so both views can use the same one.", backColor: .green, textColor: .black)
                
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
                MGE_GreenScreen_Solution(showGreenScreen: $showGreenScreen,
                                         namespace: namespace)
            }
        }
        .font(.title)
        .animation(.easeIn)
    }
}

struct MGE_GreenScreen_Solution: View {
    @Binding var showGreenScreen: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        Color.green
            .ignoresSafeArea()
            .overlay(Text("Stop"))
            .matchedGeometryEffect(id: "twoScreens", in: namespace)
            .onTapGesture { showGreenScreen.toggle() }
    }
}


struct MGE_TwoScreens_Namespaces_Solution_Previews: PreviewProvider {
    @Namespace static var namespace
    @State static var showGreenScreen = true
    
    static var previews: some View {
        Group {
            MGE_TwoScreens_Namespaces_Solution()
            MGE_GreenScreen_Solution(showGreenScreen: $showGreenScreen,
                                     namespace: namespace)
        }
    }
}
