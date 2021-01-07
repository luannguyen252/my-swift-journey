//
//  ContentView.swift
//  BullsEye
//
//  Created by Juan Francisco Dorado Torres on 20/12/20.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()

  var body: some View {
    ZStack {
      BackgroundView(game: $game)

      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100.0)

        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }

      }

      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the Bull's Eye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)

      BigNumberText(text: "\(game.target)")
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double

  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    Button(
      action: {
        withAnimation {
          alertIsVisible = true
        }
      },
      label: {
        Text("Hit me!".uppercased())
          .bold()
          .font(.title3)
      }
    )
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
          startPoint: .top,
          endPoint: .bottom
        )
      }
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .previewLayout(
        .fixed(
          width: 812,
          height: 375
        )
      )
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(
        .fixed(
          width: 812,
          height: 375
        )
      )
  }
}
