//
//  GeometryReader_SafeAreaInsets.swift
//  100Views
//
//  Created by Mark Moeykens on 7/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GeometryReader_SafeAreaInsets : View {
    var body: some View {
        VStack(spacing: 10) {
HeaderView("GeometryReader", subtitle: "SafeAreaInsets", desc: "GeometryReader can also tell you the safe area insets it has.", back: .clear)

GeometryReader { geometryProxy in
    VStack {
        Text("geometryProxy.safeAreaInsets.leading: \(geometryProxy.safeAreaInsets.leading)")
        Text("geometryProxy.safeAreaInsets.trailing: \(geometryProxy.safeAreaInsets.trailing)")
        Text("geometryProxy.safeAreaInsets.top: \(geometryProxy.safeAreaInsets.top)")
        Text("geometryProxy.safeAreaInsets.bottom: \(geometryProxy.safeAreaInsets.bottom)")
    }
    .padding()
}
.background(Color.pink)
.foregroundColor(.white)
        }
        .font(.title)
    }
}

struct GeometryReader_SafeAreaInsets_Previews : PreviewProvider {
    static var previews: some View {
        GeometryReader_SafeAreaInsets()
    }
}
