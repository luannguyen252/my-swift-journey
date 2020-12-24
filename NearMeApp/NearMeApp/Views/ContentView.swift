//
//  ContentView.swift
//  NearMeApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    // MARK: - GET NEAR BY LANDMARKS
    private func getNearByLandmarks() {
        let request = MKLocalSearch.Request()
        
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
    }
    
    // MARK: - CALCULATE OFFSET
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: landmarks)
            
            TextField("Search", text: $search, onEditingChanged: { _ in }) {
                self.getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                self.tapped.toggle()
            }
            .animation(.spring())
            .offset(y: calculateOffset())
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
