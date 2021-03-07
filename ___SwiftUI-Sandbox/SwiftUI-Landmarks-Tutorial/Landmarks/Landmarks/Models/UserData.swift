//
//  UserData.swift
//  Landmarks
//
//  Created by Nicholas Fox on 6/5/19.
//  Copyright © 2019 Nick Fox. All rights reserved.
//

import SwiftUI
import Combine


final class UserData: BindableObject {

    let didChange = PassthroughSubject<UserData, Never>()

    var showFavoritesOnly: Bool = false {
        didSet { didChange.send(self) }
    }
    var landmarks = landmarkData {
        didSet { didChange.send(self) }
    }
}
