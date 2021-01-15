//
//  FollowerItemView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct FollowerItemView: View {
    private let model: FollowerItemViewModel
    
    init(follower: Follower) {
        self.model = FollowerItemViewModel(follower)
    }
    
    var body: some View {
        HStack {
            NetworkImage(url: model.imageURL)
                .scaledToFit()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 44, alignment: .center)
                .clipShape(Circle())
                .accessibility(hidden: true)
            VStack(alignment: .leading) {
                Text(model.name)
                    .font(.headline)
                Text(model.username)
                    .font(.subheadline)
                    .accessibility(label: Text(model.accessibilityUsername))
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(label: Text("accessibility_label_follower_item"))
    }
}
