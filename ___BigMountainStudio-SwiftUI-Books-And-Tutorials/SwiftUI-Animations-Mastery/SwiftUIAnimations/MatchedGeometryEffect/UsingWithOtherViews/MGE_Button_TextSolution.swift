//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Button_TextSolution: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Button - Text Solution")
            BannerText("In the previous example, you have have noticed the shapes moved while the text didn't. You can match multiple groups of views to transition independently of each other.", backColor: .green)
            Spacer()
            if showDetail {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
                    .matchedGeometryEffect(id: "button", in: namespace)
                    .overlay(Text("More Details")
                                .foregroundColor(.white)
                                .padding(.top)
                                .matchedGeometryEffect(id: "text", in: namespace,
                                                       properties: .position)
                             , alignment: .top)
                    .frame(height: 300)
                Spacer()
                Button("Close", action: { showDetail.toggle() })
            } else {
                Button(action: { showDetail.toggle() }) {
                    Text("Show More")
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "text", in: namespace,
                                               properties: .position)
                        .padding()
                        .padding(.horizontal)
                        .background(Capsule()
                                        .fill(Color.blue)
                                        .matchedGeometryEffect(id: "button", in: namespace))
                }
            }
        }
        .font(.title)
        .animation(.default)
        .padding(.bottom)
    }
}

struct MGE_Button_TextSolution_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Button_TextSolution()
    }
}
