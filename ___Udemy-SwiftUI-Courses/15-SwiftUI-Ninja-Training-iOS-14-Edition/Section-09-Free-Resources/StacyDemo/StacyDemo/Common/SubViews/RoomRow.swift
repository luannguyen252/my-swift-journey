//
//  RoomRow.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import SwiftUI

struct RoomRow: View {
  
  let room: Room
  
    var body: some View {
      VStack(alignment: .leading) {
        UserCellRow(user: room.user, userType: room.userType, userAvatar: room.userAvatar)
        
        Image(room.image)
          .resizable()
          .frame(height: 240)
        
        HStack{
          Text("\(room.beds) BEDS")
            .font(.caption)
            .foregroundColor(.bed)
            .padding(.top, 4)
          Spacer()
        }
        .padding(.horizontal)
        
        Text(room.shortDescription)
          .bold()
          .foregroundColor(.title)
          .font(.title3)
          .padding(.horizontal)
          .padding(.vertical, 4)
        
        Text("$\(room.price) per month")
          .font(.subheadline)
          .foregroundColor(.text)
          .padding(.horizontal)
          .padding(.bottom)
      }
      .padding(.bottom, 8)
    }
}

struct RoomRow_Previews: PreviewProvider {
    static var previews: some View {
      RoomRow(room: roomData[0])
    }
}
