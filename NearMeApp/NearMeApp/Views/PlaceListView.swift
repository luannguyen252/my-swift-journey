//
//  PlaceListView.swift
//  NearMeApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    // MARK: - PROPERTIES
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            } //: HSTACK
            .frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.black).opacity(0.5)
            .gesture(TapGesture().onEnded(self.onTap))
            
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .fontWeight(.bold)
                        
                        Text(landmark.title)
                    } //: VSTACK
                }
            } //: LIST
            .animation(nil)
        } //: VSTACK
        .cornerRadius(10)
    }
}

// MARK: - PREVIEw
#if DEBUG
struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
#endif
