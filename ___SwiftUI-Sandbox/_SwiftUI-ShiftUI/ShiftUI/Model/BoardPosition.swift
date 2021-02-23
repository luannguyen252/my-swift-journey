//
//  BoardPosition.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-19.
//

import Foundation

enum BoardPosition: Comparable, UniqueById {
  case occupied(square: ShiftSquare)
  case empty(position: Position)
  
  var position: Position {
    switch self {
    case let .occupied(square):
      return square.position
    case let .empty(position):
      return position
    }
  }
  
  var isEmpty: Bool {
    switch self {
    case .empty:
      return true
    case .occupied:
      return false
    }
  }
  
  var square: ShiftSquare? {
    switch self {
    case let .occupied(square):
      return square
    case .empty:
      return nil
    }
  }
  
  var id: Position {
    switch self {
    case let .occupied(square):
      return square.id
    case let .empty(position):
      return Position(row: -position.row, column: -position.column)
    }
  }
  
  static func < (lhs: BoardPosition, rhs: BoardPosition) -> Bool {
    lhs.position < rhs.position
  }
}
