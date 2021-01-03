//
//  struct SubviewModel- Identifiable {     let imageString- String     let title- String     let caption- String     let id = UUID() } .swift
//  OnboardingApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - SUBVIEW MODEL
struct SubViewModel: Identifiable {
    let imageString: String
    let title: String
    let caption: String
    let id = UUID()
    let tag: Tab
}

// MARK: - TAB
enum Tab: Hashable {
    case meditating
    case running
    case walking
}

// MARK: - SUBVIEW DATA
let subViewData = [
    SubViewModel(imageString: "meditating", title: "Take some time out", caption: "Take your time out and bring awareness into your everyday life", tag: .meditating),
    SubViewModel(imageString: "running", title: "Conquer personal hindrances", caption: "Meditating helps you dealing with anxiety and bringing calmness into your life", tag: .running),
    SubViewModel(imageString: "walking", title: "Create a peaceful mind", caption: "Regular meditation sessions create a peaceful inner mind", tag: .walking)
]
