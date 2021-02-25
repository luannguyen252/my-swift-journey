//
//  UserManager.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

class UserManager: ObservableObject {
    @Published var userData = Data.data
    
    func changeUserDraggingValue(index: Int) {
        userData[index].isDragging.toggle()
    }
}
