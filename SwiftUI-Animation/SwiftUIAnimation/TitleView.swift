//
//  TitleView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PROPERTIES
    @State var showTitle = false
    
    // MARK: - BODY
    var body: some View {
        Text("Best Games")
            .font(.largeTitle)
            .fontWeight(.heavy)
            // Add scale effect
            .scaleEffect(showTitle ? 1.2 : 1)
            .animation(.easeInOut)
            .onTapGesture {
                self.showTitle.toggle()
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
#endif
