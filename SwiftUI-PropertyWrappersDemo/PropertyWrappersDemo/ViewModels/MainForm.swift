//
//  ContentForm.swift
//  PropertyWrappersDemo
//
//  Created by Alfian Losari on 10/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation
import Combine

class MainForm: ObservableObject {
    
    @Published var textToUppercase: String = "" {
        willSet { uppercasedText = newValue }
    }
    
    @Uppercased var uppercasedText: String = "" {
        willSet { objectWillChange.send() }
    }
    
    @Published var date: Date = Date() {
        willSet { formattedDate = date }
    }
    
    @ISO8601DateFormatted var formattedDate: Date = Date() {
        willSet { objectWillChange.send() }
    }
    
    static let minimumNumber = 17.0
    static let maximumNumber = 65.0
    
    @Published var numberValue = 35.0 {
        didSet { rangedNumber = numberValue }
    }

    @Ranged(minimum: minimumNumber, maximum: maximumNumber) var rangedNumber = 35.0 {
        didSet { objectWillChange.send() }
    }
    
    static let row1Key = "ROW_1"
    static let row2Key = "ROW_2"
    
    @Localizable var title = MainForm.row1Key
    @Localizable var subtitle = MainForm.row2Key
    
}
