//
//  CategoryView.swift
//  FoodDeliveryPart2
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct CategoryView: View {
    // MARK: - PROPERTIES
    let imageName: String
    let categoryName: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 150)
                    .clipped()
                    .cornerRadius(20.0)
                
                Text(categoryName)
                    .font(.custom("HelveticaNeue-Medium", size: 50))
                    .foregroundColor(.white)
            } //: ZSTACK
            
            Spacer()
        } //: HSTACK
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(imageName: "burger", categoryName: "BURGER")
    }
}
#endif
