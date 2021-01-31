//
//  ContentView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

import SwiftUI
import MapKit

struct ContentView: View {
    // MARK: - PROPERTIES
    @StateObject var placeFinder = PlaceFinder()

    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            //: MAP VIEW WITH MARKERS OF PLACES
            Map(coordinateRegion: $placeFinder.region, annotationItems: placeFinder.spots) { spot in
                MapAnnotation(coordinate: spot.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    MapMarker(placeName: spot.name)
                }
            }
            .ignoresSafeArea()
            //: PLACE CARD PAGER VIEW
            PagerView(
                count: placeFinder.spots.count,
                index: $placeFinder.currentIndex,
                viewWidth: UIScreen.screenWidth - 40,
                content: {
                ForEach(placeFinder.spots) { place in
                    PlaceCardView(place: place)
                        .frame(width: UIScreen.screenWidth - 60, height: 380)
                        .onTapGesture {
                            withAnimation {
                                placeFinder.selectedPlace = place
                            }
                        }
                }
            }) //: PAGER VIEW
            .opacity(placeFinder.selectedPlace == nil ? 1.0 : 0.0)

            if placeFinder.selectedPlace != nil {
                PlaceDetailView(placeFinder: placeFinder)
            }
        } //: ZSTACK
        .onAppear {
            placeFinder.currentIndex = 0
        }
    }
}

// MARK: - UI SCREEN
extension UIScreen {
   static let screenWidth   = UIScreen.main.bounds.size.width
   static let screenHeight  = UIScreen.main.bounds.size.height
   static let screenSize    = UIScreen.main.bounds.size
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
