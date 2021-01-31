//
//  Paddings.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct Paddings: View {
    // MARK: - BODY
    var body: some View {
        // 1. Edge Insets Padding
        Text("Padding Edge Insets")
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .foregroundColor(.white)
            .background(Color.black)
        
        // 2. Overall Padding
        Text("Padding Edge Insets")
            .padding(20)
            .foregroundColor(.white)
            .background(Color.black)
            

        // 3. Left Padding
        Text("Left Padding")
            .padding(.leading, 20)
            .foregroundColor(.white)
            .background(Color.black)
            
        // 4. Right Padding
        Text("Right Padding")
            .padding(.trailing, 20)
            .foregroundColor(.white)
            .background(Color.black)
            
        // 5. Top Padding
        Text("Top Padding")
            .padding(.top, 20)
            .foregroundColor(.white)
            .background(Color.black)
            
        // 6. Bottom Padding
        Text("Bottom Padding")
            .padding(.bottom, 20)
            .foregroundColor(.white)
            .background(Color.black)
    }
}

// MARK: - PREVIEW
struct Paddings_Previews: PreviewProvider {
    static var previews: some View {
        Paddings()
    }
}
