//
//  FollowerItemViewModel.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation

class FollowerItemViewModel {
    private let follower: Follower

    var name: String { follower.name }
    var username: String { "(\(follower.username))" }
    var imageURL: URL { URL(string: follower.profileImage)! }
    
    var accessibilityUsername: String { String(format: NSLocalizedString("accessibility_label_follower_username", comment: ""), follower.username) }
    
    init(_ follower: Follower) {
        self.follower = follower
    }
}
