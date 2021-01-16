//
//  ListBackgroundColorView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct ListBackgroundColorView: View {
    var body: some View {
        List {
            ForEach(1...100, id: \.self) { i in
                Text("\(i)")
                    .listRowBackground( (i % 2 == 0) ? Color.clear : Color.green )
            }
        }
    }
}

struct ListBackgroundColorView_Previews: PreviewProvider {
    static var previews: some View {
        ListBackgroundColorView()
    }
}
