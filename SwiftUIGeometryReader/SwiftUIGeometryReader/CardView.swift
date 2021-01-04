//
//  CardView.swift
//  SwiftUIGeometryReader
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height / 4)
                        .background(Color.pink)
                        .border(Color.black)
                    
                    Text("SwiftUI GeometryReader")
                        .fontWeight(.heavy)
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .background(Color.orange)
                        .border(Color.black)
                    
                    Text("Layout with Geometry Reader")
                        .fontWeight(.heavy)
                        .frame(width: geometry.size.width, height: geometry.size.height / 4)
                        .background(Color.blue)
                        .border(Color.black)
                } //: VSTACK
            } //: GEOMETRY READER
        } //: ZSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .border(Color.red)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
#endif
