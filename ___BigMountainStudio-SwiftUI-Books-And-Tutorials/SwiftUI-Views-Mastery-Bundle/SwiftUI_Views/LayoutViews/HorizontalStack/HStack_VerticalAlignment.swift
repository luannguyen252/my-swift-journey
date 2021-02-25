//
//  HStack_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HStack_VerticalAlignment : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack").font(.largeTitle)
            Text("Vertical Alignment")
                .font(.title).foregroundColor(.gray)
            Text("By default, views within an HStack are vertically aligned in the center.")
                .frame(maxWidth: .infinity)
                .padding().layoutPriority(1)
                .background(Color.orange).font(.title)
                .foregroundColor(.black)
            
            HStack {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
            HStack(alignment: .top) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Top")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
            HStack(alignment: .bottom) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Bottom")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
        }
    }
}

struct HStack_VerticalAlignment_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            HStack_VerticalAlignment()
        }
    }
}

