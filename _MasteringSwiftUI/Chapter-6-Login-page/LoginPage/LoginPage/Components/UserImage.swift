//
//  UserImage.swift
//  LoginPage
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct UserImage: View {
    // MARK: - PROPERTIES
    @State var profilePicture: String
    
    // MARK: - BODY
    var body: some View {
        Image(profilePicture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(75)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(profilePicture: "ProfilePicture")
    }
}
#endif
