//
//  String+Ext.swift
//  Embed YouTube Videos
//
//  Created by Leonardo Bilia on 30/03/20.
//  Copyright © 2020 Leonardo Bilia. All rights reserved.
//

import SwiftUI

extension String {

    func extractYoutubeID() -> String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else { return nil }
        return (self as NSString).substring(with: result.range)
    }
}
