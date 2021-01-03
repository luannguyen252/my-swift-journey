//
//  ContentView.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // MARK: - PROPERTIES
    // Location manager
    @EnvironmentObject var locationManager: LocationManager
    
    // Make current annotation point
    @State var currentAnnotation: MKPointAnnotation?
    
    // Show photo grid
    @State var showPhotoGrid = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                MyMap(showPhotoGrid: $showPhotoGrid, currentRegion: $locationManager.currentRegion, currentAnnotation: $currentAnnotation)
                Button(action: {
                    locationManager.goToUserLocation()
                }) {
                    LocationButtonContent()
                }
            }
            .navigationBarTitle("Long-press to drop pin", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showPhotoGrid, content: {
                PhotoGrid(latitudeToSearchFor: (currentAnnotation?.coordinate.latitude)!, longitudeToSearchFor: (currentAnnotation?.coordinate.longitude)!)
            })
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocationManager())
    }
}
#endif

// MARK: - LOCATION BUTTON CONTENT
struct LocationButtonContent: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            
            Image(systemName: "location")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .clipped()
                .foregroundColor(.black)
                .padding(40)
        } //: ZSTACK
    }
}
