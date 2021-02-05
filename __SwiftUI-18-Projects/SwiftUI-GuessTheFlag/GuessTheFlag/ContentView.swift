//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sandesh on 08/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

//Day 24 Challenge 3
struct Flag: View, Identifiable {
    let id = UUID()
    var forCountry: String
    var action: () -> ()
    @State var animationAmont = 0.0
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(forCountry)
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 2)
        }
        .rotation3DEffect(.degrees(animationAmont), axis: (x: 1, y: 0, z: 0))
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia",
                                    "France",
                                    "Germany",
                                    "Ireland",
                                    "Italy",
                                    "Nigeria",
                                    "Poland",
                                    "Russia",
                                    "Spain",
                                    "UK",
                                    "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var animationAmount = 0.0
    
    @State private var flags: [Flag] = []
    
    var body: some View {
        print(flags.count)
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(flags)  { flag in
                    flag
                }
                
                Text("Current Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            if scoreTitle == "Correct" {
                return Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                    })
            } else {
                return Alert(title: Text("Wrong!"), message: Text("That is the flag of \(scoreTitle)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                    })
            }
        }
        .onAppear(perform: askQuestion)
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            withAnimation {
                flags[number].animationAmont += 360
            }
            
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = countries[number]
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        flags = [
            Flag(forCountry: self.countries[0], action: { self.flagTapped(0) }),
            Flag(forCountry: self.countries[1], action: { self.flagTapped(1) }),
            Flag(forCountry: self.countries[2], action: { self.flagTapped(2) }),
        ]
        correctAnswer = Int.random(in: 0...2 )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
