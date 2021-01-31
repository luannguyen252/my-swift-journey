//
//  UpdateStore.swift
//  SwiftUIDesignCode
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
   var willChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         willChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}
