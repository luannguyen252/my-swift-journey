//
//  JSONModel.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct TimeSeriesJSON: Decodable {
    let timeSeries: [String: TimeSeries]
    
    private enum CodingKeys : String, CodingKey {
        case timeSeries = "Time Series (15min)"
    }
    
    struct TimeSeries: Decodable {
        let open, close, high, low: String
        
        private enum CodingKeys : String, CodingKey {
            case open = "1. open"
            case high = "2. high"
            case low = "3. low"
            case close = "4. close"
        }
    }
}
