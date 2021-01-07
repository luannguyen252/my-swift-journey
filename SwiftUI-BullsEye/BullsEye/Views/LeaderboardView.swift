//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Juan Francisco Dorado Torres on 24/12/20.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10.0) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10.0) {
            ForEach(game.leaderboardEntries.indices) { i in
              let entry = game.leaderboardEntries[i]
              RowView(index: i, score: entry.score, date: entry.date)
            }
          }
        }
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leadeboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leadeboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leadeboardMaxRowWidth)
  }
}

struct HeaderView: View {
  @Binding var leaderboardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      }
      HStack {
        Spacer()
        Button(
          action: {
            leaderboardIsShowing = false
          },
          label: {
            RoundedImageViewFilled(systemName: "xmark")
              .padding(.trailing)
          }
        )
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leadeboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.leadeboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leadeboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game())

  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewLayout(
        .fixed(
          width: 812,
          height: 375
        )
      )
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 812,
          height: 375
        )
      )
  }
}
