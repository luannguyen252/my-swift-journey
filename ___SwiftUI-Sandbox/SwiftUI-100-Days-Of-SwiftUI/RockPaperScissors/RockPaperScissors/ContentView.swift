//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nicholas Fox on 12/20/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

enum GameResult: CaseIterable {
  case win
  case lose
  case draw

  var description: String {
    switch self {
    case .win: return "Win"
    case .lose: return "Lose"
    case .draw: return "Draw"
    }
  }

  var opposite: GameResult {
    switch self {
    case .win: return .lose
    case .lose: return .win
    case .draw: return .draw
    }
  }
}

enum Play: CaseIterable {
  case rock
  case paper
  case scissors

  var description: String {
    switch self {
    case .rock: return "Rock"
    case .paper: return "Paper"
    case .scissors: return "Scissors"
    }
  }

  func result(against play: Play) -> GameResult {
    switch self {
    case .rock:
      switch play {
      case .rock: return .draw
      case .paper: return .lose
      case .scissors: return .win
      }
    case .paper:
      switch play {
      case .rock: return .win
      case .paper: return .draw
      case .scissors: return .lose
      }
    case .scissors:
      switch play {
      case .rock: return .lose
      case .paper: return .win
      case .scissors: return .draw
      }
    }
  }
}

struct ContentView: View {

  @State var computerPlay: Play = .rock
  @State var goal: GameResult = .win
  @State var score: Int = 0

  func startRound() {
    guard
      let newComputerPlay = Play.allCases.randomElement(),
      let newGoal = GameResult.allCases.randomElement()
      else { fatalError("Could not get an action and goal") }

    computerPlay = newComputerPlay
    goal = newGoal
  }

  var body: some View {
    VStack(spacing: 16) {
      Text("Score: \(score)")
      Text("The Computer Chose: \(computerPlay.description)")
      Text("Your goal is to: \(goal.description)")
      ForEach(Play.allCases, id: \.description) { play in
        Button(
          play.description,
          action: { self.userSelected(play) })
        .padding()
        .frame(width: 150)
        .background(Color.gray)
        .foregroundColor(.white)
      }
    }
    .onAppear(perform: startRound)
  }

  func userSelected(_ userPlay: Play) {
    checkResult(
      userPlay: userPlay,
      computerPlay: computerPlay,
      goal: goal)
    startRound()
  }

  func checkResult(userPlay: Play, computerPlay: Play, goal: GameResult) {
    let result = userPlay.result(against: computerPlay)
    if result == goal {
      score += 1
    } else {
      score -= 1
    }
  }
}






struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
