//
//  ScrollViewExample.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.red)
//                }
//            }
//        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(Color.red)
                }
            }
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
