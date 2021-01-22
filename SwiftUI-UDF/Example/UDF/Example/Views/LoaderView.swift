//
//  LoaderView.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            ActivityIndicator()
        }
        .frame(width: 150, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color.pink.opacity(0.9))
        )
        .shadow(radius: 10)
        .transition(AnyTransition.scale.animation(.spring()))
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
