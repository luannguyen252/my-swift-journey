//
//  CovidFAQModel.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 12.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

struct CovidFAQResponse: Decodable {
    let source: String
    let data: [CovidFAQModel]
}

struct CovidFAQModel: Decodable, Hashable, Equatable {
    let question: String
    let answer: String
}
