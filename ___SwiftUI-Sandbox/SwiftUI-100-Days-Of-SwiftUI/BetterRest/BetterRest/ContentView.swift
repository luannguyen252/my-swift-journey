//
//  ContentView.swift
//  BetterRest
//
//  Created by Nicholas Fox on 11/29/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  static var defaultWakeTime: Date {
      var components = DateComponents()
      components.hour = 9
      components.minute = 0
      return Calendar.current.date(from: components) ?? Date()
  }

  @State private var wakeUp: Date = defaultWakeTime
  @State private var sleepAmount: Double = 8.0
  @State private var coffeeAmount: Int = 1

  @State private var alertTitle: String = ""
  @State private var alertMessage: String = ""
  @State private var isAlertShowing: Bool = false




  func calculateBedtime() {
    let model = SleepCalculator()
    let wakeComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
    let secondsFromHours = (wakeComponents.hour ?? 0) * 60 * 60
    let secondsFromMinutes = (wakeComponents.minute ?? 0) * 60
    do {
      let prediction = try model.prediction(
        wake: Double(secondsFromHours + secondsFromHours),
        estimatedSleep: sleepAmount,
        coffee: Double(coffeeAmount))

      let sleepTime = wakeUp - prediction.actualSleep

      let formatter = DateFormatter()
      formatter.timeStyle = .short

      alertTitle = "Your ideal bedtime is.."
      alertMessage = formatter.string(from: sleepTime)

    } catch {
      alertTitle = "Error"
      alertMessage = "Something went wrong calculating your suggested bedtime."
    }
    isAlertShowing = true
  }

  var body: some View {
    NavigationView {
      Form {
        VStack(alignment: .leading, spacing: 0) {
          Text("When do you want to wake up?")
            .font(.headline)
          DatePicker(
            "Please enter a date",
            selection: $wakeUp,
            displayedComponents: .hourAndMinute)
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
        }

        VStack(alignment: .leading, spacing: 0) {
          Text("Desired amount of sleep")
            .font(.headline)
          Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier:"%g") hours")
          }
        }

        VStack(alignment: .leading, spacing: 0) {
          Text("Daily coffe intake")
            .font(.headline)
          Stepper(value: $coffeeAmount, in: 1...20) {
            coffeeAmount == 1
              ? Text("1 cup")
              : Text("\(coffeeAmount) cups")
          }
        }
      }
      .navigationBarTitle("BetterRest")
      .navigationBarItems(trailing:
        Button(action: calculateBedtime) { Text("Calculate") }
      )
      .alert(isPresented: $isAlertShowing) {
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
