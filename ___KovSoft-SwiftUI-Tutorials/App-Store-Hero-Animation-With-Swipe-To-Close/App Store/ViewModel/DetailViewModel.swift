//
//  DetailViewModel.swift
//  App Store
//
//  Created by Balaji on 14/11/20.
//

import SwiftUI

class DetailViewModel: ObservableObject {

    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")
    
    @Published var show = false
}

