//
//  CovidStateModel.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

struct CovidStateModel: Decodable {
    let value: String
}

struct CovidStates {
    let confirmed: CovidStateModel
    let deaths: CovidStateModel
    let recovered: CovidStateModel
}
