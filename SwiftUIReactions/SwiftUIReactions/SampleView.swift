//
//  SampleView.swift
//  SwiftUIReactions
//
//  Created by Luan Nguyen on 08/01/2021.
//

import SwiftUI
import Reactions

struct SampleView: View {
    let posts: [Post] = [
        .init(title: "A Post!", subtitle: "This is a great post!", imageName: "1"),
        .init(title: "A different post", subtitle: "This time a bit different post!", imageName: "2"),
        .init(title: "Lots of posts!", subtitle: "The more, the better!", imageName: "3"),
    ]
    
    var body: some View {
        VStack {
            Text("Reactions")
            .padding(.top, 32)
            .font(Font.custom("American Lemon", size: 90.0))
            .foregroundColor(.primary)
            
            List(posts) { post in
                PostCell(post: post)
            }
        }
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
