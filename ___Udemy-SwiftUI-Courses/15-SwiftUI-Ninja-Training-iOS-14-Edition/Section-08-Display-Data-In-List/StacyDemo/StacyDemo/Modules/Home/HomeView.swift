//
//  HomeView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 12/12/2020.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
  
//  init() {
//    var db = Firestore.firestore()
//    for room in roomData {
//      try? db.collection(Constants.ROOMS_COLLECTION).addDocument(from: room)
//    }
//  }
  
    var body: some View {
      ZStack {
        Color.primary
          .colorInvert()
          .ignoresSafeArea(.all)
        
        RoomListingView()
      }
      .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
