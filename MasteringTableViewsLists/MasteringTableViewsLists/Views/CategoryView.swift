//
//  CategoryView.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CategoryView: View {
    // MARK: - PROPERTIES
    var imageName: String
    var categoryName: String
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            //: CATEGORY IMAGE
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 150)
                .clipped()
                .cornerRadius(16)
            
            //: ADD SPACING
            Spacer()
            
            //: CATEGORY NAME
            Text(categoryName)
                .font(.custom("HelveticaNeue-Medium", size: 48))
                .foregroundColor(.white)
            } //: ZSTACK
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(imageName: "Image-0", categoryName: "3D Image")
    }
}
#endif
