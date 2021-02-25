//
//  HomeView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 12/12/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ZStack {
        Color.primary
          .colorInvert()
          .ignoresSafeArea(.all)
        
        Text("Hello, Home!")
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
