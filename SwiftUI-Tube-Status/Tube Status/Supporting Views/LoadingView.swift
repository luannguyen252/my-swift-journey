//
//  LoadingView.swift
//  Tube Status
//
//  Created by Clarence Ji on 7/8/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI

struct LoadingView : View {
    
    enum Style {
        case largeVertical
        case smallHorizontal
    }
    
    @State var isAnimating: Bool
    var style: Style
    
    var body: some View {
        
        conditionalView()
        
    }
    
    private func conditionalView() -> AnyView {
        
        switch style {
            
        case .largeVertical:
            
            return AnyView(
            
                VStack(alignment: .center, spacing: 6) {
                    ActivityIndicator(isAnimating: $isAnimating, style: .large)
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(Color("LightTextColor"))
                }
            
            )
            
        case .smallHorizontal:
            
            return AnyView(
            
                HStack(alignment: .center, spacing: 8) {
                    ActivityIndicator(isAnimating: $isAnimating, style: .medium)
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(Color("LightTextColor"))
                }
                
            )
            
        }
        
    }
    
}

#if DEBUG
struct LoadingView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView(isAnimating: true, style: .largeVertical)
    }
}
#endif
