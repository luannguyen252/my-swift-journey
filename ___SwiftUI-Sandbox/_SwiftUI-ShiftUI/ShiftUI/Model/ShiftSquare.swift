//
//  ShiftSquare.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-19.
//

import Foundation

struct ShiftSquare: Comparable, UniqueById {
  var position: Position
  let solvedPosition: Position
  
  init(position: Position? = nil, solvedPosition: Position) {
    self.position = position ?? solvedPosition
    self.solvedPosition = solvedPosition
  }
  
  func changingPosition(to newPosition: Position) -> ShiftSquare {
    ShiftSquare(position: newPosition, solvedPosition: solvedPosition)
  }
  
  mutating func shift(_ direction: Direction) {
    self = changingPosition(to: position.shifting(direction: direction))
  }
  
  func shifting(_ direction: Direction) -> ShiftSquare {
    changingPosition(to: position.shifting(direction: direction))
  }
  
  var id: Position {
    solvedPosition
  }

  var log: String {
    """
    number \(position.row) \(position.column)
    position \(solvedPosition.row) \(solvedPosition.column)
    """
  }
  
  static func < (lhs: ShiftSquare, rhs: ShiftSquare) -> Bool {
    lhs.position < rhs.position
  }
}
