//
//  ShiftableView.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-20.
//

import SwiftUI

struct ShiftableView<Content: View>: View {
  @ObservedObject var board: ShiftBoard
  let square: ShiftSquare
  let tileSize: CGFloat
  let content: (Bool) -> Content

  @State private var predictedDragOffset: CGSize = .zero
  @GestureState private var isDragging: Bool = false

  var body: some View {
    content(isDragging)
      .offset(tileOffset)
      .gesture(shiftGesture)
      .onChange(of: isDragging) { isDragging in
        if isDragging {
          // nothing
        } else {
          withAnimation {
            board.dragEnded(finalAmount: dragAmount(predictedDragOffset))
          }
        }
        predictedDragOffset = .zero
      }
  }
  
  var tileOffset: CGSize {
    if square == board.activeSquare {
      return tileOffset(amount: board.dragAmount)
    } else if board.pushedSquares.contains(square) {
      return tileOffset(amount: board.pushedAmount)
    } else {
      return .zero
    }
  }
  
  func tileOffset(amount: Double) -> CGSize {
    let offset = CGFloat(amount) * tileSize
    switch board.dragDirection {
    case .up:
      return CGSize(width: 0, height: -offset)
    case .down:
      return CGSize(width: 0, height: offset)
    case .left:
      return CGSize(width: -offset, height: 0)
    case .right:
      return CGSize(width: offset, height: 0)
    case .none:
      return .zero
    }
  }
  
  var shiftGesture: some Gesture {
    DragGesture()
      .updating($isDragging) { value, gestureState, transaction in
        gestureState = true
      }
      .onChanged { value in
        predictedDragOffset = value.predictedEndTranslation
        board.drag(square, amount: dragAmount(value.translation))
      }
  }
  
  func dragAmount(_ translation: CGSize) -> Double {
    Double(dragOffset(translation) / tileSize)
  }
  
  func dragOffset(_ translation: CGSize) -> CGFloat {
    switch board.shiftableDirection(of: square) {
    case .up:
      return -translation.height
    case .down:
      return translation.height
    case .left:
      return -translation.width
    case .right:
      return translation.width
    case .none:
      return .zero
    }
  }
  
}
