//
//  RoomListingView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import SwiftUI

struct RoomListingView: View {
  
  @StateObject var roomListingViewModel = RoomListingViewModel()
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          LazyVStack {
            ForEach(roomListingViewModel.rooms, id: \.localId) {
              item in
              RoomRow(room: item)
                .background(Color.primary.colorInvert()
                              .shadow(color: Color.black.opacity(0.6), radius: 4, x: 0, y: 4))
            }
          }
          .background(Color.tableBackground)
        }
        .navigationTitle("Rooms")
      }
    }
}

struct RoomListingView_Previews: PreviewProvider {
    static var previews: some View {
      RoomListingView()
    }
}
