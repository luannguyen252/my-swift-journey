//
//  FooterView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/9/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct FooterView: View {
    
    //MARK: - PROPERTIES
    @Binding var textFieldTapped: Bool
    @Binding var guessWords: [String]
    
    var averageOfLetters: Double {
        let wordCount = guessWords.count
        //if theres no words in the guessWords array, return 0
        if wordCount == 0 {
            return 0
        }
        var totalLetters = 0
        //get a total of all the letters in each word
        for letterCount in guessWords {
            totalLetters += letterCount.count
        }
        return Double(totalLetters) / Double(wordCount)
        
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 80) {
                ZStack {
                    Image("background").resizable()
                    .frame(width: 80, height: 50)
                    .clipShape(Capsule())
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .shadow(color: .black, radius: 1, x: -1, y: -1)
                    
                    Text("\(guessWords.count)")
                    .frame(width: 50, height: 20)
                    .font(.system(size: 25))
                    .padding(20)
                    .foregroundColor(.white)
                    .font(.system(size: 80))
                        .scaleEffect(textFieldTapped ? 0.1 : 1.2)
                        .animation(Animation.interactiveSpring(dampingFraction: 0.2).delay(0.3))
                    
                    Image("foundWords").resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 100, height: 70)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .offset(y: 40)
                    .padding(.horizontal, -10)
                    .padding(.bottom, -10)
                }
                ZStack {
                    Image("background").resizable()
                        .frame(width: 80, height: 50)
                        .clipShape(Capsule())
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .shadow(color: .black, radius: 1, x: -1, y: -1)
                        
                    Text("\(averageOfLetters, specifier: "%.0f")")
                        .frame(width: 50, height: 20)
                        .font(.system(size: 25))
                        .padding(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 80))
                        .scaleEffect(textFieldTapped ? 0.1 : 1.2)
                    .animation(Animation.interactiveSpring(dampingFraction:0.2).delay(0.3))
                        
                    Image("letterAverage").resizable()
                        .aspectRatio(contentMode: .fill)
                        .shadow(color: .black, radius: 1, x: 1, y: 1)
                        .frame(width: 100, height: 70)
                        .offset(y: 40)
                        .padding(.bottom, -10)
                }
                
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var textFieldTapped: Bool = false
    @State static var guessWords = [String]()
    
    static var previews: some View {
        FooterView(textFieldTapped: $textFieldTapped, guessWords: $guessWords)
            .previewLayout(.fixed(width: 350, height: 125))
    }
}
