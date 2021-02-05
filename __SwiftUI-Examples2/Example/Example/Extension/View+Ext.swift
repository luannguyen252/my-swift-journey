//
//  View+Ext.swift
//  Example
//
//  Created by PowerMobileWeb on 2019/6/10.
//  Copyright © 2019 PowerMobileWeb. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    static var name: String {
        return String(describing: self)
    }
}
