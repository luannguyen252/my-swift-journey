//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nicholas Fox on 11/29/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State private var countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US"
  ].shuffled()

  @State private var correctAnswer = Int.random(in: 0...2)

  @State private var showingScore: Bool = false
  @State private var scoreTitle: String = ""
  @State private var alertMessage: String = ""
  @State private var score: Int = 0

  @State private var incorrectOpacity: Double = 1
  @State private var rotationAmount: Double = 0

  private func flagTapped(_ index: Int) {
    if index == correctAnswer {
      scoreTitle = "Correct"
      score += 1
      alertMessage = "Your score is \(score)"
    } else {
      scoreTitle = "Wrong"
      score = 0
      alertMessage = "You chose the flag of \(countries[index])"
    }
    showingScore = true
  }

  private func askQuestion() {
    incorrectOpacity = 1.0
    rotationAmount = 0
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }

  var body: some View {

    ZStack {

      LinearGradient(
        gradient: Gradient.init(colors: [.blue, .black]),
        startPoint: .top,
        endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(.white)
          Text("\(countries[correctAnswer])")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }

        ForEach(0..<3) { number in
          Button(
            action: {
              self.flagTapped(number)
              withAnimation {
                if number == self.correctAnswer {
                  self.rotationAmount += 365
                }
                self.incorrectOpacity = 0.25
              }
            },
            label: {
              Image(self.countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 2)
            }
          )
          .opacity(number == self.correctAnswer ? 1.0 : self.incorrectOpacity)
          .rotation3DEffect(
            .degrees(number == self.correctAnswer ? self.rotationAmount : 0),
              axis: (x: 0, y: 1, z: 0)
          )
        }

        Text("Your Score is: \(score)")
          .foregroundColor(.white)

        Spacer()
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(
        title: Text(scoreTitle),
        message: Text(alertMessage),
        dismissButton: .default(Text("Continue")) { self.askQuestion() })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
