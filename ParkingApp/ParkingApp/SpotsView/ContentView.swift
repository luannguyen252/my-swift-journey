//
//  ContentView.swift
//  ParkingApp
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var parkingFinder = ParkingFinder()

    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()

            Map(
                coordinateRegion: $parkingFinder.region,
                annotationItems: parkingFinder.spots) { spot in
                MapAnnotation(
                    coordinate: spot.location,
                    anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    Button(action: {
                        parkingFinder.selectedPlace = spot
                    }, label: {
                        SpotAnnotatonView(
                            fee: "\(Int(spot.fee))",
                            selected: spot.id == parkingFinder.selectedPlace?.id)
                    })
                }
            }
            .cornerRadius(75)
            .edgesIgnoringSafeArea(.top)
            .offset(y: -70)
            
            VStack {
                TopNavigationView()
                
                Spacer()

                ParkingCardView(parkingPlace: parkingFinder.selectedPlace ?? parkingFinder.spots[0])
                    .offset(y: -30)
                    .onTapGesture {
                        parkingFinder.showDetail = true
                    }

                SearchView()
            }
            .padding(.horizontal)
            
            if parkingFinder.showDetail {
                ParkingDetailView(
                    parkingFinder: parkingFinder,
                    region: MKCoordinateRegion(
                        center: parkingFinder.selectedPlace?.location ?? parkingFinder.spots[0].location,
                        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)))
            }
        }
        .onAppear {
            parkingFinder.selectedPlace = parkingFinder.spots[0]
        }
    }
}

// Color
extension Color {
    static let darkColor = Color.init(red: 46/255, green: 45/255, blue: 45/255)
    static let lightColor = Color.init(red: 254/255, green: 254/255, blue: 254/255)
    static let yellowColor = Color.init(red: 245/255, green: 210/255, blue: 49/255)
}

// UIScreen
extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
