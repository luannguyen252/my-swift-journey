//
//  FavoriteView.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    var isFavorite: Bool
    
    var body: some View {
        Image(systemName: isFavorite ? "star.fill" : "star")
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(isFavorite: false)
    }
}
