//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Example1: View {
    @State private var expand = false
    @Namespace var articles
    
    var body: some View {
        VStack {
            if expand == false {
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Article One")
                            .bold()
                            .matchedGeometryEffect(id: "title", in: articles)
                        Text("This is a long form article that we should expand or collapse.")
                            .matchedGeometryEffect(id: "text", in: articles)
                    }
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange)
                        .frame(width: 125, height: 125)
                        .matchedGeometryEffect(id: "Images", in: articles, anchor: .top)
                }
                .onTapGesture {
                    expand.toggle()
                }
            }
            
            if expand {
                VStack(alignment: .leading, spacing: 8) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange)
                        .frame(height: 400)
                        .matchedGeometryEffect(id: "Images", in: articles, anchor: .top)
                    Text("Article One")
                        .bold()
                        .matchedGeometryEffect(id: "title", in: articles)
                    Text("This is a long form article that we should expand or collapse.")
                        .matchedGeometryEffect(id: "text", in: articles)
                }
                .padding(.horizontal)
                .onTapGesture {
                    expand.toggle()
                }
            }
        }
        .animation(.spring())
    }
}

struct MGE_Example1_Previews: PreviewProvider {
    static var previews: some View {
        MGE_Example1()
    }
}
