//
//  ContentView.swift
//  BetterRest
//
//  Created by Sandesh on 15/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeup = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    @State private var aletTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    private var cupValues = Array(1...20)
    
    
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    Text("Sleeping Time:")
                    Text(calculateBedTime() ?? "00:00")
                    .font(.largeTitle)
                }
                
                Section {
                    Text("When you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeup, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section {
                    Text("Desired amout to sleep")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in:  4 ... 12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section {
                    Text("Daily coffee intake (Cups)")
                        .font(.headline)
                    Picker("Number of coffee cups", selection: $coffeeAmount){
                        ForEach(cupValues, id: \.self) { cup in
                            Text("\(cup) ")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                }
            }
            .navigationBarTitle("BetterRest")
            // .navigationBarItems(trailing:
            // Button(action: calculateBedTime) {
            // Text("Calculate")
            // }
            // )
            // .alert(isPresented: $showingAlert) {
            // Alert(title: Text(aletTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            // }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedTime() -> String?  {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour,.minute], from: wakeup)
        let hour = (components.hour ?? 0) * 60 * 60
        let minutes = (components.minute ?? 0) * 60
        
        
        // MARK:- Third challenge
        do {
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeup - prediction.actualSleep
            
            // showing sleep time
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: sleepTime)
            
            // alertMessage = formatter.string(from: sleepTime)
            // aletTitle = "Your sleep time is..."
        } catch {
            // aletTitle = "Error!"
            // alertMessage = "Sorry, there was  problem while calculating your bed time"
            print(error.localizedDescription)
        }
        
        return nil
        // showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
