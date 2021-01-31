//
//  MapWidgetExampleApp.swift
//  MapWidgetExample
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import SwiftUI

@main
struct MapWidgetExampleApp: App {
    // MARK: - Dependencies

    private let locationManager = LocationManager()

    // MARK: - Render

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                }
        }
    }
}
