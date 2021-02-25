//
//  SearchView.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 22))
                .padding()
            Text("Parking address...")
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "chevron.left")
                .padding()
        }
    }
}
