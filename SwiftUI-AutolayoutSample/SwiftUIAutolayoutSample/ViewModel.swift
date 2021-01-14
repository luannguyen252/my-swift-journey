//
//  ViewModel.swift
//  SwiftUIAutolayoutSample
//
//  Created by usayuki on 2020/10/17.
//

import Combine
import UIKit

final class ViewModel: ObservableObject {

    let subject1 = PassthroughSubject<CGFloat, Never>()
    let subject2 = PassthroughSubject<CGFloat, Never>()

    func send1(height: CGFloat) {
        subject1.send(height)
    }

    func send2(height: CGFloat) {
        subject2.send(height)
    }
}
