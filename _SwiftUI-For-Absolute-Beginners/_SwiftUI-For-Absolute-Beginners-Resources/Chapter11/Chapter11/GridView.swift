//
//  GridView.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 50) {
                ForEach(0..<25) { _ in
                    Divider()
                }
            }
            HStack(alignment: .center, spacing: 50) {
                ForEach(0..<25) { _ in
                    Divider()
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
