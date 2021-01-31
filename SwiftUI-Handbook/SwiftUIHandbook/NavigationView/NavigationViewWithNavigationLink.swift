//
//  NavigationViewWithNavigationLink.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct NavigationViewWithNavigationLink: View {
    // MARK: - BODY
    var body: some View {
        // 1.
        NavigationView {
            NavigationLink(destination: Text("Second View")) {
                Text("Go To Second View")
            }
            .navigationBarTitle("Navigation")
        }
        
        // 2.
        NavigationView {
            NavigationLink(destination: Text("Second View")) {
                Image(uiImage: #imageLiteral(resourceName: "Image-5"))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            .navigationBarTitle("Navigation")
        }
    }
}

// MARK: - PREVIEW
struct NavigationViewWithNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewWithNavigationLink()
    }
}
