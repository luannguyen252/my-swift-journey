//
//  UserCellRow.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import SwiftUI

struct UserCellRow: View {
  let user: String
  let userType: String
  let userAvatar: String
  
    var body: some View {
      HStack {
        Image(userAvatar)
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40)
          .clipShape(Circle())
        VStack(alignment: .leading, spacing: 2) {
          Text(user)
            .fontWeight(.semibold)
            .foregroundColor(.title)
          Text(userType)
            .foregroundColor(.text)
            .font(.caption)
        }
        .padding(.leading, 8)
        Spacer()
      }
      .padding(.horizontal)
      .padding(.top)
    }
}

struct UserCellRow_Previews: PreviewProvider {
    static var previews: some View {
      UserCellRow(user: "Susie Jenkins",
                  userType: "Roommate",
                  userAvatar: "susie")
    }
}
