//
//  ListModel.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/04.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI
import Combine

class ListStore: ObservableObject {
    @Published var updates: [ListModel] = listData
}

struct ListModel: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

// Note: These test images are in the asset.
let listData = [
    ListModel(image: "Card1", title: "SwiftUI Advanced", text: "Opportunity to learn advanced topics in SwiftUI.  SwiftUI is great for fast prototyping", date: "JAN 1"),
    ListModel(image: "Card2", title: "Creating list", text: " Subjects include but not limited to: @State, @Binding, @Published, ObservableObbject", date: "OCT 17"),
    ListModel(image: "Card3", title: "Code life", text: "As much as you can love coding, there is more to life than writing code, it's only a part of the puzzle.", date: "AUG 27"),
    ListModel(image: "Card4", title: "SwiftUI", text: "Stay buy to Storyboard, Nibs, and Delegation.", date: "JUNE 26"),
    ListModel(image: "Card5", title: "World", text: "Travel the world, coding will make it possible.", date: "JUN 11")
]
