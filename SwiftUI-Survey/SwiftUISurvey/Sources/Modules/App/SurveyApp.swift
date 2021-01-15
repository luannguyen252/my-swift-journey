//
//  SurveyApp.swift
//  SwiftUISurvey
//
//  Created by Amir on 07/06/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

@main
struct SurveyApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabbarView()
                .environmentObject(SurveyAppModel())
        }
    }
}
