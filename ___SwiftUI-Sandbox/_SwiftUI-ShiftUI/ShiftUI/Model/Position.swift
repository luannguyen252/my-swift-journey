//
//  Position.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-19.
//

import Foundation

struct Position: Equatable, Hashable, Comparable {
  let row: Int
  let column: Int
  
  static func < (lhs: Position, rhs: Position) -> Bool {
    lhs.row < rhs.row || (lhs.row == rhs.row && lhs.column < rhs.column)
  }
  
  func sharesColumn(with position: Position) -> Bool {
    self.column == position.column
  }
  
  func sharesRow(with position: Position) -> Bool {
    self.row == position.row
  }
  
  func isAbove(_ position: Position) -> Bool {
    sharesColumn(with: position) && self < position
  }
  
  func isBelow(_ position: Position) -> Bool {
    sharesColumn(with: position) && self > position
  }
  
  func isLeft(of position: Position) -> Bool {
    sharesRow(with: position) && self < position
  }
  
  func isRight(of position: Position) -> Bool {
    sharesRow(with: position) && self > position
  }
  
  func direction(to position: Position) -> Direction {
    if position.isAbove(self) {
      return .up
    } else if position.isBelow(self) {
      return .down
    } else if position.isLeft(of: self) {
      return .left
    } else if position.isRight(of: self) {
      return .right
    } else {
      return .none
    }
  }
  
  func isBetween(a: Position, b: Position) -> Bool {
    if (self.sharesColumn(with: a) && self.sharesColumn(with: b)) || (self.sharesRow(with: a) && self.sharesRow(with: b)) {
      return (a < self && self < b) || (b < self && self < a)
    }
    return false
  }
  
  func shifting(direction: Direction) -> Position {
    switch direction {
    case .up:
      return Position(row: row - 1, column: column)
    case .down:
      return Position(row: row + 1, column: column)
    case .left:
      return Position(row: row, column: column - 1)
    case .right:
      return Position(row: row, column: column + 1)
    case .none:
      return self
    }
  }
}
