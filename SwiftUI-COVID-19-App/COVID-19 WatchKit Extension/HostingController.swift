//
//  HostingController.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 23/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import COVID_19_UI

class HostingController: WKHostingController<COVID19ListView> {

    override var body: COVID19ListView {

        return COVID19ListView()

    }

}
