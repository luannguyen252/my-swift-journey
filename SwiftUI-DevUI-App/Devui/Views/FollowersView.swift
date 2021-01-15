//
//  FollowersView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct FollowersView: View {
    @StateObject private var model = FollowersViewModel()
    
    func onFollowerAppear(_ follower: Follower) {
        if model.followers.isLastItem(follower) {
            model.loadMoreFollowers()
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let error = model.error {
                    Text(NSLocalizedString(error.localizedDescription, comment: ""))
                } else if model.loading {
                    ProgressView()
                } else {
                    List(model.followers) { follower in
                        FollowerItemView(follower: follower)
                            .onAppear(perform: { onFollowerAppear(follower) })
                    }
                }
            }
            .navigationTitle("section_followers")
        }
    }
}
