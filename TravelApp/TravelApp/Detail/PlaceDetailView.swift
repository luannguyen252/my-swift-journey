//
//  PlaceDetailView.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct PlaceDetailView: View {
    // MARK: - PROPERTIES
    @ObservedObject var placeFinder: PlaceFinder
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.5))
                .ignoresSafeArea()
            VStack {
                //: TOP NAVIGATION VIEW
                TopNavigationView(placeFinder: placeFinder)
                ScrollView(.vertical, showsIndicators: false) {
                    //: FLIGHT VIEW
                    FlightView()
                    //: ACTIVITIES VIEWS
                    ForEach(placeFinder.selectedPlace?.activities ?? []) { activity in
                        ActivityView(activity: activity)
                    }
                } //: SCROLLVIEW
                .padding(.horizontal)
            } //: VSTACK
        } //: ZSTACK
    }
}
