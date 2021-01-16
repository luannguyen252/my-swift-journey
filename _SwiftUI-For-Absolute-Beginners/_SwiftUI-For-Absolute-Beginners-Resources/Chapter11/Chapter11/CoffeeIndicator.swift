//
//  CoffeeIndicator.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

enum CoffeeTemperature {
    case hot
    case cold
}

struct CoffeeIndicator: View {
    var coffee: CoffeeTemperature = .hot
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: coffee == .hot ? "thermometer.sun" : "thermometer.snowflake")
                .foregroundColor(coffee == .hot ? Color.red : Color.blue)
                .font(.largeTitle)
                .frame(width: 24, height: 24)
            HStack {
                Text("Coffee Type - ")
                Text("\(coffee == .hot ? "Hot" : "Cold")")
                    .bold()
            }
            
        }
    }}

struct CoffeeIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeIndicator()
    }
}


struct CoffeeFormView: View {
    
    @State private var temperature: Bool = !false
    @State private var cups: Int = 1
    @State private var index = 0
    
    fileprivate func AnOptionItem(icon: String, text: String, tag: Int) -> some View {
        Image(systemName:"thermometer.\(icon)")
            .foregroundColor(text == "Hot" ? Color.red : Color.blue)
            .tag(tag)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        // Just the sample in the book
                        Toggle(isOn: $temperature) {
                            CoffeeIndicator(coffee: temperature ? .hot : .cold)
                            
                        }
                    }
                    
                    // This uses the form to build upon a more complex example
                    Section(header: Text("Coffee Temperature").bold()) {
                        Picker(selection: $index, label: Text("Coffee type"), content: {
                            AnOptionItem(icon: "sun", text:"Hot", tag:0)
                            AnOptionItem(icon:"snowflake", text:"Cold", tag:1)
                        })
                            .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Quantity").bold()) {
                        Stepper(onIncrement: {
                            if self.cups < 5 {self.cups += 1}
                        }, onDecrement: {
                            if self.cups > 1 {self.cups -= 1}
                        },
                           onEditingChanged: {_ in
                            //
                        }){
                            Text("Cups of coffee : \(self.cups)")
                        }
                    }
                    
                    Section() {
                        Button("Order"){
                            print("Ordered coffee")
                        }
                    }
                }.padding()
                    .navigationBarTitle("Order Coffee")
            }
        }
    }
}


struct CoffeeFormView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeFormView()
    }
}
