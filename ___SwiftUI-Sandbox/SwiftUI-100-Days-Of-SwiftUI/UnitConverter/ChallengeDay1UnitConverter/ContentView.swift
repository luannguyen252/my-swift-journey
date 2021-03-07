//
//  ContentView.swift
//  ChallengeDay1UnitConverter
//
//  Created by Nicholas Fox on 11/27/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI


enum Temperature {

  case celsius
  case fahrenheit
  case kelvin

  var displayName: String {
    switch self {
    case .celsius:
      return "ºC"
    case .fahrenheit:
      return "ºF"
    case .kelvin:
      return "K"
    }
  }

  var unit: UnitTemperature {
    switch self {
    case .celsius:
      return UnitTemperature.celsius
    case .fahrenheit:
      return UnitTemperature.fahrenheit
    case .kelvin:
      return UnitTemperature.kelvin
    }
  }

  static var allValues: [Temperature] {
    return [
      .celsius,
      .fahrenheit,
      .kelvin,
    ]
  }

  static func convert(_ value: Double, from: Temperature, to: Temperature) -> Double {
    // TODO: Actually implement the business logic
    return 42
  }
}

struct ContentView: View {

  @State private var inputValue: String = "0"
  @State private var inputUnitIndex: Int = 0
  @State private var outputUnitIndex: Int = 1

  private var inputUnit: UnitTemperature {
    return Temperature.allValues[inputUnitIndex].unit
  }

  private var outputUnit: UnitTemperature {
    return Temperature.allValues[outputUnitIndex].unit
  }

  private var input: Measurement<UnitTemperature> {
    let value = Double(inputValue) ?? 0
    return Measurement(value: value, unit: inputUnit)
  }

  private var output: Measurement<UnitTemperature> {
    return input.converted(to: outputUnit)
  }


  var body: some View {
    Form {
      Section(header: Text("Convert From:")) {
        TextField("Input", text: $inputValue)
          .keyboardType(.decimalPad)
        Picker("Units", selection: $inputUnitIndex) {
          ForEach(0..<Temperature.allValues.count) {
            Text(Temperature.allValues[$0].displayName)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }

      Section(header: Text("To:")) {
        Text("\(output.value)")
        Picker("Units", selection: $outputUnitIndex) {
          ForEach(0..<Temperature.allValues.count) {
            Text(Temperature.allValues[$0].displayName)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
