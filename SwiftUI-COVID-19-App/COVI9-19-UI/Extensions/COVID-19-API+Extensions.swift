//
//  COVID-19-API+Extensions.swift
//  COVID-19
//
//  Created by michael.chan on 27/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import COVID_19_API

extension SCMPCountry {
    
    static public func random() -> SCMPCountry {
        
        SCMPCountry(id: "", name: String.randomString(length: 8), cases: .random(in: 0...10000), deaths: .random(in: 0...10000), recovered: .random(in: 0...100000), lastUpdated: nil, comments: nil)
        
    }
    
}
