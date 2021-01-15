//
//  UserSettings.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/12.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import Foundation

// ObservableObject는 여러가지 뷰가 하나의 데이터를 공유할때 쓰기 좋다.
// ObservableObject는 class 타입으로 상속 받아야한다.

class UserSettings:ObservableObject {
//    Published는 변수에 대한 값이 변경될때 뷰에게 알려주는 트리거 역할을 한다.
    @Published var score = 0
}
