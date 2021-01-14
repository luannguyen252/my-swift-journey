//
//  GridVM.swift
//  AppStoreGrid
//
//  Created by Serafín Ennes Moscoso on 08/11/2020.
//

import Foundation

class GridVM: ObservableObject {
    // String == Category
    @Published var apps: [String: [Application]] = [:]

    public var allCategories: [String] {
        apps.keys.map({ String($0) })
    }

    public func app(for category: String) -> [Application] {
        return apps[category] ?? []
    }

    init() {
        setupApps()
    }

    func setupApps() {
        apps["Top Free Apps"] = mockApps
        apps["Popular Apps to Try"] = mockApps.shuffled()
        apps["Get Stuff Done"] = mockApps.shuffled()
        apps["Social Networking"] = mockApps.shuffled()
        apps["Work Remotely"] = mockApps.shuffled()
        apps["Lear a new language"] = mockApps.shuffled()
        apps["Play an instrument"] = mockApps.shuffled()
        apps["Books"] = mockApps.shuffled()
        apps["Business"] = mockApps.shuffled()
        apps["Education"] = mockApps.shuffled()
    }
}
