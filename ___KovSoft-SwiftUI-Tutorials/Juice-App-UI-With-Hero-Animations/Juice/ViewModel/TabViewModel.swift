//
//  TabViewModel.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

class TabViewModel: ObservableObject {

    @Published var selectedItem : Item!
    @Published var isDetail = false
}
