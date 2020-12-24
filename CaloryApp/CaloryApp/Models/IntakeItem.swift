//
//  IntakeItem.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct IntakeItem: Hashable {
    let name: String
    let imageName: String
    let isAdded: Bool
    let recommandedLower: Int
    let recommandedHigher: Int
    let caloryIntake: Int
}
