//
//  BitmapGridView.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI
import UIKit

let screenBounds = UIScreen.main.bounds.size
let _wd: CGFloat = 30
let _ht: CGFloat = 30
let across = Int(screenBounds.width / _wd)
let down = Int(screenBounds.height / _ht)

struct BitmapGridView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: _ht-1) {
                ForEach(0..<down) { _ in
                    Divider()
                }
            }
            HStack(alignment: .center, spacing: _wd-1) {
                ForEach(0..<across) { _ in
                    Divider()
                }
            }
        }.offset(x: 0, y: 0)
    }
}

struct BitmapGridView_Previews: PreviewProvider {
    static var previews: some View {
        BitmapGridView()
    }
}
