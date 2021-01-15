//
//  SurveyAppModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 01/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation
import Combine

class SurveyAppModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var selectedTab: TabbarName = .manage
    
}

