//
//  UserManager.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

class UserManager: ObservableObject {
    @Published var userData = Data.data
    
    func changeUserDraggingValue(index: Int) {
        userData[index].isDragging.toggle()
    }
}
