//
//  SearchView.swift
//  ParkingApp
//
//  Created by Luan Nguyen on 16/12/2020.
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
