//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Nicholas Fox on 6/3/19.
//  Copyright © 2019 Nick Fox. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {

    @EnvironmentObject var userData: UserData

    var body: some View {

        List {
            Toggle.init(isOn: $userData.showFavoritesOnly) {
                Text("Favorites Only")
            }

            ForEach(landmarkData) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
        }
    }
}
#endif
