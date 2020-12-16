//
//  LocationMap.swift
//  PublicArt
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct LocationMap: View {
    // MARK: - PROPERTIES
    @Binding var showModal: Bool
    var artwork: Artwork
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - ARTWORK MAP
            MapView(coordinate: artwork.coordinate)
            
            // MARK: - ARTNAME NAME AND CLOSE BUTTON
            HStack {
                Text(self.artwork.locationName)
                
                Spacer()
                
                Button("Done") { self.showModal = false }
            }
            .padding()
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct LocationMap_Previews: PreviewProvider {
  static var previews: some View {
    LocationMap(showModal: .constant(true), artwork: artData[0])
  }
}
