//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Ashwin Das on 13/02/20.
//  Copyright © 2020 TheAlphamerc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert: Bool = false
    
    func computeScore() -> Int {
        let rDifff = rGuess - rTarget
        let gDifff = gGuess - gTarget
        let bDifff = bGuess - bTarget
        let diff = sqrt(rDifff * rDifff  + gDifff * gDifff + bDifff * bDifff)
        return Int((1-diff) * 100.0 + 0.5)
       
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Rectangle()
                     .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess,opacity: 1.0))
                    Text("Match this color")
                }
                VStack {
                    Rectangle()
                    .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget,opacity: 1.0))
                    HStack{
                        Text("R: \(Int(rGuess * 255))")
                        Text("G: \(Int(gGuess * 255))")
                        Text("B: \(Int(bGuess * 255))")
                    }
                }
            }
            Button(action:{
                self.showAlert = true
            }){
                 Text("Hit me!")
            }
            .padding(.top,20)
            .alert(isPresented: $showAlert){
                Alert(title: Text("Your score"), message: Text("\(computeScore())"))
            }
            VStack{
                ColorSlider(value:$rGuess, textColor: .red)
                ColorSlider(value:$gGuess, textColor: .green)
                ColorSlider(value:$bGuess, textColor: .blue)
            }
        }


  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack{
            Text("0")
                .foregroundColor(textColor)
            Slider(value:$value)
            Text("255")
                .foregroundColor(textColor)
        }
        .padding()
    }
}
