//
//  Game.swift
//  BullsEye
//
//  Created by Juan Francisco Dorado Torres on 22/12/20.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []

  func points(sliderValue: Int) -> Int {
    let difference = abs(sliderValue - target)
    let bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }

    return 100 - difference + bonus
  }

  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    addToLeaderboard(points: points)
  }

  mutating func restart() {
    target = Int.random(in: 1...100)
    score = 0
    round = 1
  }

  private mutating func addToLeaderboard(points: Int) {
    let entry = LeaderboardEntry(score: points, date: Date())
    leaderboardEntries.append(entry)
    leaderboardEntries.sort { $0.score > $1.score }
  }
}
