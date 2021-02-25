//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Button_Problem: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Button - Problem")
            BannerText("A matchedGeometryEffect is on the button but the animation looks wrong. How can this be fixed?", backColor: .green)
            Spacer()
            if showDetail {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
                    .overlay(Text("More Details").foregroundColor(.white)
                                .padding(.top), alignment: .top)
                    .matchedGeometryEffect(id: "button", in: namespace)
                    .frame(height: 300)
                Spacer()
                Button("Close", action: { showDetail.toggle() })
            } else {
                Button(action: { showDetail.toggle() }) {
                    Text("Show More")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Capsule()
                                        .fill(Color.blue))
                }
                .matchedGeometryEffect(id: "button", in: namespace)
            }
        }
        .font(.title)
        .animation(.default)
        .padding(.bottom)
    }
}

struct MGE_Button_Problem_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Button_Problem()
    }
}
