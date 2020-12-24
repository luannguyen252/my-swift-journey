//
//  BackgroundBlurs.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct BackgroundBlurs: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "Image-14"))
            
            VStack() {
                Text("Background Blur")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Blurs(style: .systemThinMaterial))
            // .systemThickMaterial
            // .systemMaterial
            // .systemThinMaterial
            // .systemUltraThinMaterial
            // .systemChromeMaterial
        }
    }
}

// MARK: - PREVIEW
struct BackgroundBlurs_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlurs()
    }
}
