//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_MultipleEffects_Problems: View {
    @State private var showHelp = false
    @Namespace var namespace
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Multiple Effects - Problems")
            BannerText("You want the button to expand into the help text. Everything looks correct but it can be improved so the icons transition independently of the green shapes.", backColor: .green)
            ZStack {
                if showHelp == false {
                    Image(systemName: "questionmark")
                        .padding()
                        .background(Circle().fill(Color.green))
                        .matchedGeometryEffect(id: "help", in: namespace)
                        .onTapGesture { showHelp.toggle() }
                } else {
                    VStack {
                        Image(systemName: "questionmark.circle")
                        ScrollView {
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
                    .matchedGeometryEffect(id: "help", in: namespace)
                    .onTapGesture { showHelp.toggle() }
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

struct MGE_MultipleEffects_Problems_Previews: PreviewProvider {
    static var previews: some View {
        MGE_MultipleEffects_Problems()
    }
}
