//
//  RoomListingViewModel.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import Foundation


class RoomListingViewModel: ObservableObject {
  @Published var rooms: [Room] = []
  
  private var roomService = RoomService()
  
  init() {
    roomService.getRooms { [self] (fetchedRooms) in
      DispatchQueue.main.async {
        if let fetchedRooms = fetchedRooms {
          rooms = fetchedRooms
        }
      }
    }
  }
}
