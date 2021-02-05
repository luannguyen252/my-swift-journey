//
//  ContentView.swift
//  UnitConverter
//
//  Created by Sandesh on 07/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue                   = ""
    
    @State private var selectedLenghtInput          = 0
    @State private var selectedLenghtOutput         = 0
    
    @State private var selectedTemperatureInput     = 0
    @State private var selectedTemperatureOutput    = 0
    
    @State private var selectedTimeInput            = 0
    @State private var selectedTimeOutput           = 0
    
    @State private var selectedVolumeInput          = 0
    @State private var selectedVolumeOutput         = 0
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Enter Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Lenght Conversion (Select FROM - TO) ")) {
                    Picker("SelectInput", selection: $selectedLenghtInput) {
                        ForEach(0 ..< Converter.LENGHT_UNITS.count) {
                            Text(Converter.LENGHT_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("SelectInput", selection: $selectedLenghtOutput) {
                        ForEach(0 ..< Converter.LENGHT_UNITS.count) {
                            Text(Converter.LENGHT_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(getLenghtConversion(), specifier: "%.2f")")
                }
                
                Section(header: Text("Temperature Conversion (Select FROM - TO) ")) {
                    Picker("SelectInput", selection: $selectedTemperatureInput) {
                        ForEach(0 ..< Converter.TEMPERATURE_UNITS.count) {
                            Text(Converter.TEMPERATURE_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("SelectInput", selection: $selectedTemperatureOutput) {
                        ForEach(0 ..< Converter.TEMPERATURE_UNITS.count) {
                            Text(Converter.TEMPERATURE_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(getTemperatureConversion(), specifier: "%.2f")")
                }
                
                
                Section(header: Text("Time Conversion (Select FROM - TO) ")) {
                    Picker("SelectInput", selection: $selectedTimeInput) {
                        ForEach(0 ..< Converter.TIME_UNITS.count) {
                            Text(Converter.TIME_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("SelectInput", selection: $selectedTimeOutput) {
                        ForEach(0 ..< Converter.TIME_UNITS.count) {
                            Text(Converter.TIME_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(getTimeConversion(), specifier: "%.2f")")
                }
                
                
                Section(header: Text("Volume Conversion (Select FROM - TO) ")) {
                    Picker("SelectInput", selection: $selectedVolumeInput) {
                        ForEach(0 ..< Converter.VOLUME_UNITS.count) {
                            Text(Converter.VOLUME_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("SelectInput", selection: $selectedVolumeOutput) {
                        ForEach(0 ..< Converter.VOLUME_UNITS.count) {
                            Text(Converter.VOLUME_UNITS[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Result: \(getVolumeConversion(), specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
    
    
    //["meters", "kilometers", "feet", "yards"]
    private func getLenghtConversion() -> Double {
        guard let input = Double(inputValue) else { return 0 }
        
        switch (selectedLenghtInput,selectedLenghtOutput) {
        case (0,0)  : return Converter.convertLenght(value: input, input: .meters, output: .meters)
        case (0,1)  : return Converter.convertLenght(value: input, input: .meters, output: .kilometers)
        case (0,2)  : return Converter.convertLenght(value: input, input: .meters, output: .feet)
        case (0,3)  : return Converter.convertLenght(value: input, input: .meters, output: .yards)
            
        case (1,0)  : return Converter.convertLenght(value: input, input: .kilometers, output: .meters)
        case (1,1)  : return Converter.convertLenght(value: input, input: .kilometers, output: .kilometers)
        case (1,2)  : return Converter.convertLenght(value: input, input: .kilometers, output: .feet)
        case (1,3)  : return Converter.convertLenght(value: input, input: .kilometers, output: .yards)
            
        case (2,0)  : return Converter.convertLenght(value: input, input: .feet, output: .meters)
        case (2,1)  : return Converter.convertLenght(value: input, input: .feet, output: .kilometers)
        case (2,2)  : return Converter.convertLenght(value: input, input: .feet, output: .feet)
        case (2,3)  : return Converter.convertLenght(value: input, input: .feet, output: .yards)
            
        case (3,0)  : return Converter.convertLenght(value: input, input: .yards, output: .meters)
        case (3,1)  : return Converter.convertLenght(value: input, input: .yards, output: .kilometers)
        case (3,2)  : return Converter.convertLenght(value: input, input: .yards, output: .feet)
        case (3,3)  : return Converter.convertLenght(value: input, input: .yards, output: .yards)
            
        default     : return 0
        }
    }
    
    //["Celsius", "Fahrenheit", "Kelvin"]
    private func getTemperatureConversion() -> Double {
        guard let input = Double(inputValue) else { return 0 }
        
        switch (selectedTemperatureInput,selectedTemperatureOutput) {
        case (0,0)  : return Converter.convertTemperature(value: input, input: .celsius, output: .celsius)
        case (0,1)  : return Converter.convertTemperature(value: input, input: .celsius, output: .fahrenheit)
        case (0,2)  : return Converter.convertTemperature(value: input, input: .celsius, output: .kelvin)
            
        case (1,0)  : return Converter.convertTemperature(value: input, input: .fahrenheit, output: .celsius)
        case (1,1)  : return Converter.convertTemperature(value: input, input: .fahrenheit, output: .fahrenheit)
        case (1,2)  : return Converter.convertTemperature(value: input, input: .fahrenheit, output: .kelvin)
            
        case (2,0)  : return Converter.convertTemperature(value: input, input: .kelvin, output: .celsius)
        case (2,1)  : return Converter.convertTemperature(value: input, input: .kelvin, output: .fahrenheit)
        case (2,2)  : return Converter.convertTemperature(value: input, input: .kelvin, output: .kelvin)
            
        default     : return 0
        }
    }
    //["seconds", "minutes", "hours"]
    private func getTimeConversion() -> Double {
        guard let input = Double(inputValue) else { return 0 }
        switch (selectedTimeInput,selectedTimeOutput) {
        case (0,0)  : return Converter.convertTime(value: input, input: .seconds, output: .seconds)
        case (0,1)  : return Converter.convertTime(value: input, input: .seconds, output: .minutes)
        case (0,2)  : return Converter.convertTime(value: input, input: .seconds, output: .hours)
            
        case (1,0)  : return Converter.convertTime(value: input, input: .minutes, output: .seconds)
        case (1,1)  : return Converter.convertTime(value: input, input: .minutes, output: .minutes)
        case (1,2)  : return Converter.convertTime(value: input, input: .minutes, output: .hours)
            
        case (2,0)  : return Converter.convertTime(value: input, input: .hours, output: .seconds)
        case (2,1)  : return Converter.convertTime(value: input, input: .hours, output: .minutes)
        case (2,2)  : return Converter.convertTime(value: input, input: .hours, output: .hours)
            
        default     : return 0
        }
    }
    
    //["milliliters", "liters", "cups", "pints", "gallons"]
    private func getVolumeConversion() -> Double {
        guard let input = Double(inputValue) else { return 0 }
        
        switch (selectedVolumeInput,selectedVolumeOutput) {
        case (0,0)  : return Converter.convertVolume(value: input, input: .milliliters, output: .milliliters)
        case (0,1)  : return Converter.convertVolume(value: input, input: .milliliters, output: .liters)
        case (0,2)  : return Converter.convertVolume(value: input, input: .milliliters, output: .cups)
        case (0,3)  : return Converter.convertVolume(value: input, input: .milliliters, output: .pints)
        case (0,4)  : return Converter.convertVolume(value: input, input: .milliliters, output: .gallons)
            
            
        case (1,0)  : return Converter.convertVolume(value: input, input: .liters, output: .milliliters)
        case (1,1)  : return Converter.convertVolume(value: input, input: .liters, output: .liters)
        case (1,2)  : return Converter.convertVolume(value: input, input: .liters, output: .cups)
        case (1,3)  : return Converter.convertVolume(value: input, input: .liters, output: .pints)
        case (1,4)  : return Converter.convertVolume(value: input, input: .liters, output: .gallons)
            
            
        case (2,0)  : return Converter.convertVolume(value: input, input: .cups, output: .milliliters)
        case (2,1)  : return Converter.convertVolume(value: input, input: .cups, output: .liters)
        case (2,2)  : return Converter.convertVolume(value: input, input: .cups, output: .cups)
        case (2,3)  : return Converter.convertVolume(value: input, input: .cups, output: .pints)
        case (2,4)  : return Converter.convertVolume(value: input, input: .cups, output: .gallons)
            
            
        case (3,0)  : return Converter.convertVolume(value: input, input: .pints, output: .milliliters)
        case (3,1)  : return Converter.convertVolume(value: input, input: .pints, output: .liters)
        case (3,2)  : return Converter.convertVolume(value: input, input: .pints, output: .cups)
        case (3,3)  : return Converter.convertVolume(value: input, input: .pints, output: .pints)
        case (3,4)  : return Converter.convertVolume(value: input, input: .pints, output: .gallons)
            
            
        case (4,0)  : return Converter.convertVolume(value: input, input: .gallons, output: .milliliters)
        case (4,1)  : return Converter.convertVolume(value: input, input: .gallons, output: .liters)
        case (4,2)  : return Converter.convertVolume(value: input, input: .gallons, output: .cups)
        case (4,3)  : return Converter.convertVolume(value: input, input: .gallons, output: .pints)
        case (4,4)  : return Converter.convertVolume(value: input, input: .gallons, output: .gallons)
            
            
        default     : return 0
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
