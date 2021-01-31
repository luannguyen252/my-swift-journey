//
//  HostingController.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<PlantListView> {
    lazy private(set) var connectivityProvider: PhoneConnectivityProvider = {
        let provider = PhoneConnectivityProvider()
        provider.connect()
        return provider
    }()
    
    private lazy var listViewModel = PlantListViewModel(connectivityProvider: connectivityProvider)
    
    override var body: PlantListView {
        return PlantListView(viewModel: listViewModel)
    }
}
