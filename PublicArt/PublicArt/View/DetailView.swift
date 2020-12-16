//
//  DetailView.swift
//  PublicArt
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let artwork: Artwork
    @State private var showMap = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            //: ARTWORK IMAGE
            Image(artwork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
            
            //: ARTWORK NAME
            Text("\(artwork.reaction) \(artwork.title)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            //: ARTWORK LOCATION
            HStack {
                Button(action: { self.showMap = true }) {
                    Image(systemName: "mappin.and.ellipse")
                }
                .sheet(isPresented: $showMap) {
                    // MapView(coordinate: self.artwork.coordinate)
                    LocationMap(showModal: self.$showMap, artwork: self.artwork)
                }
                
                Text(artwork.locationName)
                    .font(.subheadline)
            } //: HSTACK
            
            //: ARTWORK ARTIST
            Text("Artist: \(artwork.artist)")
                .font(.subheadline)
            
            Divider()
            
            //: ARTWORK DESCRIPTION
            Text(artwork.description)
                .multilineTextAlignment(.leading)
                .lineLimit(20)
        } //: VSTACK
        .padding()
        .navigationBarTitle(Text(artwork.title), displayMode: .inline)
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView(artwork: artData[0])
    }
}
