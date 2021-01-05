//
//  SendNotication.swift
//  SwiftUINotification
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI

final class SendNotification: ObservableObject {
    @Published var name: String = ""
    @Published var message: String = ""
    @Published var alert: Bool = false
}
