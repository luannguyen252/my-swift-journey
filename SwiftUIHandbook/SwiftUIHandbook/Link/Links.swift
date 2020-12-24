//
//  Links.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Links: View {
    var body: some View {
        VStack(spacing: 16) {
            // MARK: - LINK DEFAULT
            Link("Apple Developer Website",
                 destination: URL(string: "https://developer.apple.com/")!)
                .font(.title3)
                .foregroundColor(.black)
            
            // MARK: - LINK WITH ICON
            Link(destination: URL(string: "https://developer.apple.com/")!) {
                Image(systemName: "applelogo")
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text("Apple Developer Website")
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
}

struct Links_Previews: PreviewProvider {
    static var previews: some View {
        Links()
    }
}
