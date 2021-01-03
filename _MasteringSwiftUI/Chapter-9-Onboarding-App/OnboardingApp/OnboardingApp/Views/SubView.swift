//
//  Subview.swift
//  OnboardingApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct SubView: View {
    // MARK: - PROPERTIES
    let subViewModel: SubViewModel
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                // 1. Image
                Image(subViewModel.imageString)
                    .resizable()
                    .frame(height: geometry.size.height/2)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, 70)
                    .padding()
                
                // 2. Title
                Text(subViewModel.title)
                        .font(.title)
                        .padding()
                
                // 3. Caption
                Text(subViewModel.caption)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                
                Spacer()
            } //: VSTACK
        } //: GEOMETRY READER
    }
}

// MARK: - PREVIEW
#if DEBUG
struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(subViewModel: subViewData[1])
    }
}
#endif
