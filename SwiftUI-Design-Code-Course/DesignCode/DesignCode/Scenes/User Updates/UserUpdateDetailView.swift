//
//  UserUpdateDetailView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/27/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct UserUpdateDetailView: View {
    @Binding var userUpdate: UserUpdate
    
    var body: some View {
        VStack(spacing: 20.0) {
            
            Text(userUpdate.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Image(userUpdate.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(userUpdate.bodyText)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(30)
    }
}

struct UserUpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserUpdateDetailView(
            userUpdate: .constant(UserUpdatesStore.defaultUpdates[0])
        )
    }
}
