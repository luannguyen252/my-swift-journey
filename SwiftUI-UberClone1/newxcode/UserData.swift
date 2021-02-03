//
//  UserData.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI
import Combine
import CoreLocation

final class UserData: ObservableObject {
    @Published var showSideMenu = false
    @Published var showMenuItem = false
    var offset: CGFloat { showSideMenu ? 260:0 }
}

