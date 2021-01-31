//
//  NavViewSnippet.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct NavViewSnippet: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Audio")
                
                Spacer()
            }
            .navigationBarTitle("Navigation Title")
        }
    }
}

#if DEBUG
struct NavViewSnippet_Previews: PreviewProvider {
    static var previews: some View {
        NavViewSnippet()
    }
}
#endif
