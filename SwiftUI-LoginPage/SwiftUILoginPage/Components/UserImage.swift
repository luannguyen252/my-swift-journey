//
//  UserImage.swift
//  SwiftUILoginPage
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct UserImage: View {
    // MARK: - BODY
    var body: some View {
        return Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage()
    }
}
#endif
