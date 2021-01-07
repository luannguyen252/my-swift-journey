//
//  TextViews.swift
//  BullsEye
//
//  Created by Juan Francisco Dorado Torres on 23/12/20.
//

import SwiftUI

struct InstructionText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  var text: String

  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .fontWeight(.black)
      .kerning(-1.0)
      .font(.largeTitle)
  }
}

struct SliderLabelText: View {
  var text: String

  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
  }
}

struct LabelText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(1.5)
      .multilineTextAlignment(.center)
      .font(.caption)
  }
}

struct BodyText: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .lineSpacing(12.0)
      .multilineTextAlignment(.center)
      .foregroundColor(Color("TextColor"))
  }
}

struct ButtonText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(.white)
      .cornerRadius(12.0)

  }
}

struct ScoreText: View {
  var score: Int

  var body: some View {
    Text(String(score))
      .font(.title3)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
  }
}

struct DateText: View {
  var date: Date

  var body: some View {
    Text(date, style: .time)
      .font(.title3)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigBoldText: View {
  let text: String

  var body: some View {
    Text(text.uppercased())
      .font(.title)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "100")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(score: 999)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
    }
    .padding()

    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "100")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(score: 999)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
    }
    .padding()
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
  }
}
