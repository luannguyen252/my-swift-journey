//
//  Data.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
//

import SwiftUI
import MapKit

struct Data {
    static let places = [
        Place(index: 0, name: "Boracay, Philipphines", date: "31.10.2020 - 6.11.2020", imageName: "boracay", location: CLLocationCoordinate2D(latitude: 11.9672475, longitude: 121.9252489), departureDayLeft: "1 Days until departure", activities: activities1),
        Place(index: 1, name: "Dominican Republic", date: "1.9.2020 - 26.9.2020", imageName: "dominican", location: CLLocationCoordinate2D(latitude: 18.154504, longitude: -68.7120643), departureDayLeft: "15 Days until departure", activities: activities2),
        Place(index: 2, name: "Ecuador", date: "11.10.2020 - 16.10.2020", imageName: "ecuador_galapagos", location: CLLocationCoordinate2D(latitude: -0.76105, longitude: -90.333942), departureDayLeft: "1 Months until departure", activities: activities3)
    
    ]
    
    static let activities1 = [
        Activity(title: "FOUR SEASONS", imageName: "two_star", address: "Boracay Banwa it Malay, Lalawigan ng Aklan", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "SNORKLING", imageName: "snorkelers", address: "White Beach Boracay, Lalawigan ng Aklan", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "SURFING", imageName: "surfing", address: "Bulabog Beach, Malay, Philippines, Lalawigan ng Aklan", duration: "3 Hours", occupancy: "2 People", needBooking: true, price: "$29", previousPrice: "$59")
    ]
    
    static let activities2 = [
        Activity(title: "MELIA CARIBE", imageName: "melia", address: "Playas De Bavaro, Punta Cana 230001 Dominican Republic", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "ZIP LINE", imageName: "zip_line", address: "Nuestra Senora de la Altagracia", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "4x4 ATV", imageName: "ATV", address: "Bavaro Racing, Tours Point", duration: "8 Hours", occupancy: "2 People", needBooking: true, price: "$99", previousPrice: "$149")
    ]
    
    static let activities3 = [
        Activity(title: "VILLA TAINA", imageName: "melia", address: "Cabarete 57000 Dominican Republic", duration: "7 Nights", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "BIRD WATCHING", imageName: "bird", address: "Galápagos Islands, Ecuador", duration: "2 Hours", occupancy: "2 People", needBooking: false, price: "$0", previousPrice: "$0"),
        Activity(title: "SNORKLING", imageName: "snorkelers", address: "Tortuga Bay, Ecuador", duration: "8 Hours", occupancy: "2 People", needBooking: true, price: "$49", previousPrice: "$79")
    ]
}
