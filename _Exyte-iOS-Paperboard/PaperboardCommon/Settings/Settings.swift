//
//  Settings.swift
//  Paperboard
//
//  Created by Igor Zapletnev on 08.12.2020.
//  Copyright © 2020 Ice Rock. All rights reserved.
//

import Foundation

class Settings {
    struct Keyboard: Decodable {
      let voiceId: String
      let voiceName: String
      let alphabet: String
      let rightToLeft: Bool
      let locale: String
    }
    
    private let storage = SettingsStorage()
    
    var onColumnAmountChanged: ((Int) -> Void)?
    var onKeyboardChanged: ((Keyboard) -> Void)?
    
    var keyboards: [Keyboard] = {
      let decoder = PropertyListDecoder()
      guard let plist = Bundle.main.url(forResource: "Keyboards", withExtension: "plist"),
        let data = try? Data(contentsOf: plist),
        let keyboards = try? decoder.decode([Keyboard].self, from: data) else {
          return []
      }
      return keyboards
    }()
    
    var currentColumns: Int {
      get {
        return (storage.getSettingValue(.columns) as? NSNumber)?.intValue ?? 3
      }
      set {
        storage.update(.columns, withValue: NSNumber(integerLiteral: newValue))
        onColumnAmountChanged?(newValue)
      }
    }
    
    var currentKeyboard: Keyboard? {
      get {
        guard let locale = storage.getSettingValue(.locale) as? String else {
          return nil
        }
        return keyboards.first(where: { $0.locale == locale })
      }
      set {
        storage.update(.locale, withValue: newValue?.locale)
        if let nKeyboard = newValue {
          onKeyboardChanged?(nKeyboard)
        }
      }
    }
    
}
