//
//  HostingController.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 13/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ConverterMainView> {
    override var body: ConverterMainView {
        return ConverterMainView()
    }
}
