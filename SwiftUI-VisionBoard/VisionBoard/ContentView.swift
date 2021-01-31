//
//  ContentView.swift
//  VisionBoard
//
//  Created by Luan Nguyen on 04/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            // SECTION 1
            HStack(alignment: .center, spacing: 10, content: {
                // IMAGE 1
                GridItemView(imageName: "tesla")
                
                // IMAGE 2
                GridItemView(imageName: "house")
                
                // IMAGE 2
                GridItemView(imageName: "pool")
            }) //: HSTACK
            
            // SECTION 2
            HStack(alignment: .center, spacing: 10, content: {
                // IMAGE 1
                GridItemView(imageName: "apartment")
                
                // IMAGE 2
                GridItemView(imageName: "apple")
                
                // IMAGE 2
                GridItemView(imageName: "garage")
            }) //: HSTACK
            
            // SECTION 3
            HStack(alignment: .center, spacing: 10, content: {
                // IMAGE 1
                GridItemView(imageName: "library")
                
                // IMAGE 2
                GridItemView(imageName: "husky")
                
                // IMAGE 2
                GridItemView(imageName: "garden")
            }) //: HSTACK
        }) //: VStack
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
        .previewDevice("iPhone 12 Pro Max")
  }
}
