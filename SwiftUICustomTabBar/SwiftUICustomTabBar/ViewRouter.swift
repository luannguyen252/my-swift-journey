//
//  ViewRouter.swift
//  SwiftUICustomTabBar
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

enum Page {
    case home
    case liked
    case records
    case user
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
