//
//  ContentView.swift
//  Calorie (BMR Calculator)
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: CalorieModel
    
    @State var activeCardIndex: Int = 0
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            if activeCardIndex == 0 {
                TitleCard()
            }
            
            if activeCardIndex == 1 {
                GenderCard()
            }
            
            if activeCardIndex == 2 {
                AgeCard()
            }
            
            if activeCardIndex == 3 {
                HeightCard()
            }
            
            if activeCardIndex == 4 {
                WeightCard()
            }
            
            if activeCardIndex == 5 {
                ResultCard()
            }
            
            if activeCardIndex < 4 || activeCardIndex == 5 {
                
                NextButton(index: $activeCardIndex)
                
            } else {
                
                CalculateButton(index: $activeCardIndex)
            }
        }
    }
}
