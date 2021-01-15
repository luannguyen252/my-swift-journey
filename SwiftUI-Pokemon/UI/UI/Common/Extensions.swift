//
//  Extensions.swift
//  UI
//
//  Created by josh on 2019/08/28.
//  Copyright © 2019 josh. All rights reserved.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Self
    public var id: ID { return self }
}
