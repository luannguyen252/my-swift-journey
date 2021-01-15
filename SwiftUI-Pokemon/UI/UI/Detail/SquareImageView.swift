//
//  SquareImageView.swift
//  UI
//
//  Created by josh on 2019/08/28.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI
import URLImage

struct SquareImageView: View {
    let url: URL

    var body: some View {
        return URLImage(url)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(Rectangle().stroke(Color.primary, lineWidth: 2))
    }
}
