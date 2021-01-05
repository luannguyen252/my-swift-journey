//
//  UserSettings.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/8/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    
    @Published var selectedSegment: Int = UserDefaults.standard.integer(forKey: "selectedSegment") {
        didSet {
            UserDefaults.standard.set(self.selectedSegment, forKey: "selectedSegment")
        }
    }
    
    @Published var englishIsOn: Bool = UserDefaults.standard.bool(forKey: "englishIsOn") {
           didSet {
               UserDefaults.standard.set(self.englishIsOn, forKey: "englishIsOn")
           }
       }
       
       @Published var spanishIsOn: Bool = UserDefaults.standard.bool(forKey: "spanishIsOn") {
              didSet {
                  UserDefaults.standard.set(self.spanishIsOn, forKey: "spanishIsOn")
              }
          }
       
       @Published var italianIsOn: Bool = UserDefaults.standard.bool(forKey: "italianIsOn") {
                 didSet {
                     UserDefaults.standard.set(self.italianIsOn, forKey: "italianIsOn")
                 }
             }
}
