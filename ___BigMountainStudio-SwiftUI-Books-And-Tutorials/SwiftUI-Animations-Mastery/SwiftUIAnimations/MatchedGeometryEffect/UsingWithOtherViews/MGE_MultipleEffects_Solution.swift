//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_MultipleEffects_Solution: View {
    @State private var showHelp = false
    @State private var showText = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Multiple Effects - Solution")
            BannerText("The image icons now transition to each other independently of the green backgrounds. The text is delayed in showing until after the green background has fully expanded.", backColor: .green)
            
            ZStack {
                if showHelp == false {
                    Image(systemName: "questionmark")
                        .padding()
                        .background(Circle()
                                        .fill(Color.green)
                                        .matchedGeometryEffect(id: "color", in: namespace)
                        )
                        .matchedGeometryEffect(id: "image", in: namespace,
                                               properties: .position)
                        .onTapGesture { showHelp.toggle() }
                } else {
                    VStack {
                        Image(systemName: "questionmark.circle")
                            .font(.largeTitle)
                            .matchedGeometryEffect(id: "image", in: namespace,
                                                   properties: .position)
                        ScrollView {
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                .opacity(showText ? 1 : 0)
                                .animation(Animation.easeInOut)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .matchedGeometryEffect(id: "color", in: namespace)
                    )
                    .onTapGesture {
                        showHelp.toggle()
                        showText.toggle()
                    }
.onAppear {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
        showText.toggle()
    }
}
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .font(.title)
        .animation(.spring())
        .padding(.bottom)
    }
}

struct MGE_MultipleEffects_Solution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_MultipleEffects_Solution()
    }
}
