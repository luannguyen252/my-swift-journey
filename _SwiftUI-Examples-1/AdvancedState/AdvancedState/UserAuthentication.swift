//
//  UserAuthentication.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/12.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import Combine
import SwiftUI

class UserAuthentication:ObservableObject {
//    ObservableObjectPublisher 원하는 시기때 뷰에게 값을 변경했다고 알림을 줄수 있음. Published에서 통제 역할
    let objectWillChange = ObservableObjectPublisher()
    
    var username = "" {
        willSet {
            objectWillChange.send()
        }
    }
    
}
