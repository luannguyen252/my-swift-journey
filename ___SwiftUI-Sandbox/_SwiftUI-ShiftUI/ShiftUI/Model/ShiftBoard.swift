//
//  ShiftModel.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-19.
//

import Foundation

class ShiftBoard: ObservableObject {
  private(set) var totalColumns: Int = 4
  private(set) var totalRows: Int = 4
  
  @Published private(set) var squares: Set<ShiftSquare> = []
  @Published private(set) var emptyPosition: Position = Position(row: 4, column: 4)
  @Published private(set) var activeSquare: ShiftSquare? = nil
  @Published private(set) var dragAmount: Double = 0 {
    didSet {
      pushedAmount = max(dragAmount, pushedAmount)
    }
  }
  @Published private(set) var pushedAmount: Double = 0
  
  var dragDirection: Direction {
    guard let activeSquare = activeSquare else {
      return .none
    }
    return shiftableDirection(of: activeSquare)
  }
  var pushedSquares: Set<ShiftSquare> {
    guard let activeSquare = activeSquare else {
      return []
    }
    return pushableSquares(whenShifting: activeSquare)
  }
  var shiftingSquares: Set<ShiftSquare> {
    guard let activeSquare = activeSquare else {
      return []
    }
    return pushedSquares.union([activeSquare])
  }
  
  
  func initBoard(columns: Int, rows: Int) {
    self.totalColumns = columns
    self.totalRows = rows
    self.emptyPosition = Position(row: rows, column: columns)
    createBoard()
  }
  
  func createBoard() {
    squares = []
    for row in 1...totalRows {
      for column in 1...totalColumns {
        let squarePosition = Position(row: row, column: column)
        if emptyPosition != squarePosition {
          squares.insert(ShiftSquare(solvedPosition: squarePosition))
        }
      }
    }
  }
  
  var positions: [BoardPosition] {
    (squares.map({ BoardPosition.occupied(square: $0) }) + [.empty(position: emptyPosition)]).sorted()
  }
  
  func shiftableDirection(of square: ShiftSquare) -> Direction {
    square.position.direction(to: emptyPosition)
  }
  
  func pushableSquares(whenShifting square: ShiftSquare) -> Set<ShiftSquare> {
    Set(squares.filter({ $0.position.isBetween(a: square.position, b: emptyPosition) }))
  }
  
  public func drag(_ square: ShiftSquare, amount: Double) {
    activeSquare = square
    dragAmount = min(max(0, amount), 1)
  }
  
  public func dragEnded(finalAmount: Double? = nil) {
    if let finalAmount = finalAmount {
      dragAmount = finalAmount
    }
    if let activeSquare = activeSquare {
      if dragAmount >= 0.5 {
        shift(activeSquare)
      } else if pushedAmount >= 0.5 {
        pushedSquares.forEach({
          squares.update(with: $0.shifting(dragDirection))
        })
        emptyPosition = activeSquare.position.shifting(direction: dragDirection)
      }
    }
    activeSquare = nil
    dragAmount = 0
    pushedAmount = 0
  }
  
  func shift(_ square: ShiftSquare) {
    let direction = shiftableDirection(of: square)
    let pushableSquares = self.pushableSquares(whenShifting: square)
    squares.update(with: square.shifting(dragDirection))
    pushableSquares.forEach({
      squares.update(with: $0.shifting(direction))
    })
    if direction != .none {
      emptyPosition = square.position
    }
  }
}

