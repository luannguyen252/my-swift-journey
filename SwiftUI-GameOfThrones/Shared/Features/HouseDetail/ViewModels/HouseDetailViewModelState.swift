//
//  HouseDetailViewModelState.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 26.07.20.
//  Copyright © 2020 Christian Elies. All rights reserved.
//

enum HouseDetailViewModelState: Equatable {
    case idle
    case loaded(model: HouseModel)
    case loading
}
