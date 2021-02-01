//
//  OfflineBarView.swift
//  Movie-DB-SwiftUI
//
//  Created by Vidhyadharan on 29/12/20.
//

import SwiftUI

struct OfflineBarView: View {
    var body: some View {
        VStack {
            Text("Offline")
                .padding(4)
                .frame(maxWidth: .infinity)
        }
        .background(Color.systemGray)
    }
}

struct OfflineBarView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineBarView()
    }
}
