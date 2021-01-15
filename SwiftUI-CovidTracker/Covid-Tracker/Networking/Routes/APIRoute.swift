//
//  APIRoute.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

protocol APIRoute {
    var baseURL: String { get }
    
    var path: String? { get }
}
