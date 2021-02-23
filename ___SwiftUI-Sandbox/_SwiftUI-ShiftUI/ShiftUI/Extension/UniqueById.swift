//
//  UniqueById.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2020-07-23.
//

public protocol UniqueById: Identifiable, Hashable { }

extension UniqueById {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}


