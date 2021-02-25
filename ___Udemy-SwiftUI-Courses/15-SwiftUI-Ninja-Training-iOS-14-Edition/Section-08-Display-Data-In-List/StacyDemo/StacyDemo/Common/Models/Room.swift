//
//  Room.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 22/12/2020.
//

import Foundation
import FirebaseFirestoreSwift

struct Room: Identifiable, Codable {
  @DocumentID var id: String?
  
  let localId: String
  let beds: Int
  let shortDescription: String
  let price: Int
  let image: String
  let user: String
  let userType: String
  let userAvatar: String
  var booked: Bool
}

let roomData = [
  Room(localId: UUID().uuidString, beds: 2, shortDescription: "Nice Double Room with Own Bathroom", price: 400, image: "img_room", user: "Susie Jenkins", userType: "Roommate", userAvatar: "susie", booked: false),
  Room(localId: UUID().uuidString, beds: 2, shortDescription: "Double Room with Big TV and PS5", price: 650, image: "img_room2", user: "Nyle Bailey", userType: "Roommate", userAvatar: "nyle", booked: false),
  Room(localId: UUID().uuidString, beds: 3, shortDescription: "Luxury 3-bed Apartment Bathroom", price: 1500, image: "img_room_luxury", user: "Max Wilcox", userType: "Landlord", userAvatar: "max", booked: false),
  Room(localId: UUID().uuidString, beds: 3, shortDescription: "Spooky house at the end of the city", price: 700, image: "img_room_spooky", user: "Sasha Strong", userType: "Roommate", userAvatar: "sasha", booked: false)
]
