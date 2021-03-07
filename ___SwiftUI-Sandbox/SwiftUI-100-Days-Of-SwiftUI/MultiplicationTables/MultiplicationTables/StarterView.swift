//
//  StarterView.swift
//  MultiplicationTables
//
//  Created by Nicholas Fox on 1/2/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct StarterView: View {

  @State private var maxValue: Int = 5
  @State private var optionIndex: Int = 0

  var onStart: (GameOptions) -> Void

  var difficulty: Difficulty {
    return Difficulty.allCases[optionIndex]
  }

  var body: some View {
    Form {
      Section(header: Text("Which tables do you want to practice?").lineLimit(nil)) {
        Stepper("Up to: \(maxValue)", value: $maxValue, in: 0...15)
      }

      Section(header: Text("How Many Questions do you want?").lineLimit(nil)) {
        Picker("Number of Questions", selection: $optionIndex) {
          ForEach(0..<Difficulty.allCases.count) {
            Text(Difficulty.allCases[$0].rawValue.capitalized)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      Spacer()
      Button(
        action: { self.onStart(GameOptions(difficulty: self.difficulty, maxValue: self.maxValue)) },
        label: { Text("Start") })
    }
  }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
      StarterView(onStart: { _ in print("Started") })
    }
}
