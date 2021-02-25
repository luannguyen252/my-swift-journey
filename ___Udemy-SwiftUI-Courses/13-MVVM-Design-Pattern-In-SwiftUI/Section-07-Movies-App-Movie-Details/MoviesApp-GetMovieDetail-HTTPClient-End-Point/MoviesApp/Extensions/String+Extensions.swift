//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 7/31/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
