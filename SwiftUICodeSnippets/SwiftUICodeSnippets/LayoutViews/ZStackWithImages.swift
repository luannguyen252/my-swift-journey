//
//  ZStackWithImages.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ZStackWithImages: View {
    var body: some View {
        // 1.
        ZStack {
            GeometryReader { gr in
                Image("backgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: gr.size.width)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                Text("ZStack With Images")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        
        // 12
        ZStack {
            Image("backgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
        }
    }
}

#if DEBUG
struct ZStackWithImages_Previews: PreviewProvider {
    static var previews: some View {
        ZStackWithImages()
    }
}
#endif
