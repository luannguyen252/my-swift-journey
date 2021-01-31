//
//  ApiResponse.swift
//  iMovie
//
//  Created by Sandesh on 12/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

struct Dates: Codable {
    let maximum: String?
    let minimum: String?
}
struct NowPlaying: Codable {
    let results: [Movie]
    let page: Int
    let total_results: Int
    let dates: Dates?
    let total_pages: Int
}
