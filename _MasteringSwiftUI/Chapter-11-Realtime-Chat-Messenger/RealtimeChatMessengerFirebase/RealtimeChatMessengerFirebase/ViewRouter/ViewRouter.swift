//
//  ViewRouter.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .loginView
    
    init(pageToStartWith: Page) {
        currentPage = pageToStartWith
    }
}
