//
//  AppIcons.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation

public struct Icons {
    public var all: [Icon] {
        [primaryIcon] + alternateIcons
    }
    public let alternateIcons: [Icon]
    public let primaryIcon: Icon
    
    init(primaryIcon: Icon, alternateIcons: [Icon]) {
        self.primaryIcon = primaryIcon
        self.alternateIcons = alternateIcons
    }
}
