//
//  PublishedContentView.swift
//  SwiftUIBook
//
//  Created by muukii on 2019/09/16.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

struct PublishedContentView: BookView {
  
  @ObservedObject private var store: __Store = .init()
  
  var body: some View {
    Group {
      HStack {
        Button(action: {
          self.store.fire1()
        }, label: {
          Text("Fire 1")
        })
        Button(action: {
          self.store.fire2()
        }, label: {
          Text("Fire 2")
        })
      }
      HStack {
        Text(store.value1.description)
        Text(store.value2.description)
      }
    }
  }
}

fileprivate final class __Store: ObservableObject {
  
  @Published private(set) var value1: Int = 0
  @Published private(set) var value2: Int = 0
  
  func fire1() {
    value1 += 1
  }
  
  func fire2() {
    value2 += 1
  }
}

import Combine

fileprivate final class ManualStore: ObservableObject {
  
  let objectWillChange: ObservableObjectPublisher = .init()
  
  var value: Int = 0 {
    didSet {
      objectWillChange.send()
    }
  }
  
  var count: Int = 0 {
    didSet {
      objectWillChange.send()
    }
  }
  
  func fire() {
    value += 1
  }
}

