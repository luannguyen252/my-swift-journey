//
//  ContentView.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 13/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct ConverterMainView: View {
    
    @ObservedObject var converter = ConverterViewModel()
    let measurementFormatter = MeasurementFormatter()
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        return formatter
    }()
    
    func viewDidAppear() {
        converter.fromValue = 1
        fromValueChanged()
    }
    
    func fromValueChanged() {
        let measurement = Measurement(value: converter.fromValue, unit: converter.fromUnit)
        converter.toValue = measurement.converted(to: converter.toUnit).value
    }
    
    func toValueChanged() {
        let measurement = Measurement(value: converter.toValue, unit: converter.toUnit)
        converter.fromValue = measurement.converted(to: converter.fromUnit).value
    }
    
    var body: some View {
        Form {
            Section(header: Text("Unit: \(converter.unit.description)").font(.headline)) {
                VStack {
                    Text("From:\(self.measurementFormatter.string(from: converter.fromUnit))")
                        .font(.footnote)
                    TextField("From", value: $converter.fromValue, formatter: numberFormatter, onEditingChanged: { (_) in }, onCommit: fromValueChanged)
                        .font(.largeTitle)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .truncationMode(.tail)
                    
                    Text("To: \(self.measurementFormatter.string(from: converter.toUnit))")
                        .font(.footnote)
                    TextField("To", value: $converter.toValue, formatter: numberFormatter, onEditingChanged: { (_) in }, onCommit: toValueChanged)
                        .font(.largeTitle)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .truncationMode(.tail)
                }
            }
            SectionUnitView(unit: $converter.unit)
            Section(header: Text("Measurements").font(.headline)) {
                VStack {
                    Text("From")
                        .font(.footnote)
                    SectionUnitMeasurementView(unit: $converter.unit, unitDimension: $converter.fromUnit, measurementFormatter: measurementFormatter)
                    Text("To")
                        .font(.footnote)
                    SectionUnitMeasurementView(unit: $converter.unit, unitDimension: $converter.toUnit, measurementFormatter: measurementFormatter)
                }
            }
        }
        .onAppear(perform: viewDidAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterMainView()
    }
}
