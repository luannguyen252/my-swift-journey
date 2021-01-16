//
//  ZStackExample.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct ZStackExample: View {
    var body: some View {
        ZStack {
            Image(systemName: "flame.fill")
                .font(.system(size: 300))
                .foregroundColor(.orange)
            Text("ZStack\nText\non\nImage")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
        }
    }
}

struct ZStackExample_Previews: PreviewProvider {
    static var previews: some View {
        ZStackExample()
    }
}
