//
//  GridView.swift
//  MyFirstTVOSApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import Grid

struct GridView: View {
    // MARK: - PROPERTIES
    @State var selection: Int = 0
    
    // MARK: - BODY
    var body: some View {
        Grid(1...20, id: \.self) { index in
            Image("Image-\(index)")
                .resizable()
                .scaledToFit()
        }
        .gridStyle(
            StaggeredGridStyle(tracks: .min(200))
        )
        .navigationBarTitle("Staggered Grid")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
