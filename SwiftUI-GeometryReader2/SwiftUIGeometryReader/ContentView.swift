//
//  ContentView.swift
//  SwiftUIGeometryReader
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Thumbnail()
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

// MARK: - THUMBNAIL
struct Thumbnail: View {
    // MARK: - BODY
    var body: some View {
        return VStack {
            HStack(spacing: 50) {
                ForEach(1..<5) { item in
                    GeometryReader { geometry in
                        Image("\(item)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 40), axis: (x: 20, y: 20, z: 20))
                    }
                    .frame(width: 370, height: 400)
                    .padding(20)
                }
            } //: HSTACK
        } //: VSTACK
    }
}
