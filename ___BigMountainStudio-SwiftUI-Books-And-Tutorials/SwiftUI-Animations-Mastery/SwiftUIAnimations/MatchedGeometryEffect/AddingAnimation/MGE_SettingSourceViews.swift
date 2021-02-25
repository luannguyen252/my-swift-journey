//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_SettingSourceViews: View {
    @Namespace var namespace
    @State private var isSource = true
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("MatchedGeometryEffect")
            SubtitleText("Setting Source Views")
            BannerText("When hiding and showing views, you may want to make all views source for better transitions.", backColor: .green, textColor: .black)
            
            HStack {
                if change == false {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                        .frame(width: 60, height: 60)
                        .onTapGesture { change.toggle() }
                }
                Spacer()
                if change {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                        .frame(width: 160, height: 160)
                        .onTapGesture { change.toggle() }
                }
            }
            .frame(height: 160)
            
            Toggle("Both are source", isOn: $isSource)
                .padding(.horizontal)
        }
        .animation(.easeIn)
        .font(.title)
    }
}

struct MGE_SettingSourceViews_Previews: PreviewProvider {
    static var previews: some View {
        MGE_SettingSourceViews()
    }
}
