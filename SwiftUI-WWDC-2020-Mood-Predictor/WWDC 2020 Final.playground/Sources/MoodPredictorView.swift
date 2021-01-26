/*:
 # ML Model for Emotion Analysis
 
 In this file, you can use the mood predictor to type out a sentence, and the ML model will detect what emotions you are feeling.
 
 Based on the results from the ML model, you will be recommended an activity that you should do.
 
 
 ---
 
 
 ## ML Model Informaton
 The ML model was trained in a Swift Playground with around 40,000 lines of data. Each line of data contained a string of text, and 1 of 13 emotion labels.
 ---
 
 
 ## Resources
 - The data set used is available in the public domain on data.world
*/

import Foundation
import SwiftUI
import NaturalLanguage

public struct MyMoodView : View {
    // BINDING VAR FOR HIDING/SHOWING NAVIGATION BAR
    @Binding var isNavigationBarHidden : Bool;
    
    @State private var textInputValue : String = "";
    
    public init(_ isNavigationBarHidden: Binding<Bool>) {
        self._isNavigationBarHidden = isNavigationBarHidden
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("How are you feeling?")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                
                Text("In a sentence, describe your current emotions, or what is happening in your life.")
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 35, trailing: 0))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                    .font(.system(size: 14, weight: .semibold, design: .rounded))

                ZStack(alignment: .leading) {
                    if textInputValue.isEmpty { Text("I am feeling...").foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7)) }
                    TextField("", text: $textInputValue)
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
                }
                
                Divider()
                    .background(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
            }
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
            
            VStack(alignment: .center) {
                NavigationLink(destination: MyMoodResultsView(inputText: $textInputValue, isNavigationBarHidden: $isNavigationBarHidden)) {
                    Text("Next")
                        .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.5))
                .cornerRadius(5)
                .accessibility(value: Text("Next"))
                .accessibility(hint: Text("Goes to next page for ML results and recommendations."))
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            .animation(.easeInOut)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 74 / 255, green: 128 / 255, blue: 103 / 255), Color(red: 74 / 255, green: 110 / 255, blue: 128 / 255), Color(red: 89 / 255, green: 120 / 255, blue: 136 / 255)]), startPoint: .bottom, endPoint: .top))
        .onAppear {
            self.isNavigationBarHidden = false;
        }
    }
}



extension StringProtocol {
    var firstLetterUppercased : String { prefix(1).uppercased() + dropFirst() }
}

struct MyMoodResultsView : View {
    @Binding var inputText : String;
    @Binding var isNavigationBarHidden : Bool;
    
    @State private var predictedMood = "";
    @State private var predictedMoodDescription = "";
    @State private var exerciseName = "";
    
    var body : some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(predictedMood.firstLetterUppercased)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9))
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                
                Text(predictedMoodDescription)
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 35, trailing: 0))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.6))
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                
                HStack(alignment: .center) {
                    NavigationLink(destination: {
                        VStack {
                            if exerciseName == "Uplift" {
                                UpliftExerciseView(self.$isNavigationBarHidden)
                            }
                            else if exerciseName == "Relax" {
                                RelaxExerciseView(self.$isNavigationBarHidden)
                            }
                            else if exerciseName == "Breathe" {
                                BreatheExerciseView(self.$isNavigationBarHidden)
                            }
                            else if exerciseName == "Stretch" {
                                StretchExerciseView(self.$isNavigationBarHidden)
                            }
                        }
                    }()) {
                        Text("Start \(exerciseName) Exercise")
                            .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                            .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.7))
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.5))
                    .cornerRadius(5)
                    .accessibility(value: Text("Start \(exerciseName)"))
                    .accessibility(hint: Text("Go to \(exerciseName) exercise."))
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                .animation(.easeInOut)
            }
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
            .frame(minHeight: 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 255 / 255, green: 224 / 255, blue: 224 / 255), Color(red: 74 / 255, green: 110 / 255, blue: 128 / 255)]), startPoint: .bottom, endPoint: .top))
        .onAppear {
            self.isNavigationBarHidden = false;
            
            // RUN ML HERE
            
            /*
             ML Model Attribution:
             
             ML Model was trained with the following dataset:
             https://data.world/crowdflower/sentiment-analysis-in-text
             Created by user @crowdflower
             
             License is public domain
             
            */
            guard let mlModelPathString = Bundle.main.path(forResource: "NLMLModel", ofType: "mlmodelc") else {
                print("Model not found")
                return
            }
            let mlModelPath = URL(fileURLWithPath: mlModelPathString)
            
            guard let mlModelCompiled = try? NLModel(contentsOf: mlModelPath) else {print("error"); return}
            
            let predictedLabel = mlModelCompiled.predictedLabel(for: self.inputText) ?? "neutral"
            // Possible values for predicted label are :
            // neutral, worry, happiness, sadness, love, surprise, fun, relief, hate, empty,
            // enthusiasm, boredom, anger
            
            // SET A BROADER LABEL BASED ON THE PREDICTION
            var processedPredictedLabel = "";
            var processedPredictedDescription = "";
            if predictedLabel == "neutral" {
                processedPredictedLabel = "OK"
                processedPredictedDescription = "You are feeling OK. Not great, but not bad either.\n\nTo boost your mood, you can try the 'Uplift' exercise."
                self.exerciseName = "Uplift"
            }
            else if predictedLabel == "sadness" || predictedLabel == "empty" || predictedLabel == "boredom" {
                processedPredictedLabel = "down"
                processedPredictedDescription = "You are feeling down. This may be caused by extra stress or sadness in your life, or boredom."
                self.exerciseName = "Uplift"
            }
            else if predictedLabel == "love" || predictedLabel == "surprise" || predictedLabel == "fun" || predictedLabel == "relief" || predictedLabel == "happiness" || predictedLabel == "enthusiasm" {
                processedPredictedLabel = "Happy"
                processedPredictedDescription = "You are feeling happy. Good things are happening in your life.\n\nTake some time to relax with the 'Relax' exercise. You have been working hard, you deserve a nice relaxation break!"
                self.exerciseName = "Relax"
            }
            else if predictedLabel == "worry" {
                processedPredictedLabel = "stressed"
                processedPredictedDescription = "You are feeling stressed. You may have a lot going on in your life right now.\n\nTake some time to think and be calm, with the 'Breathe' exercise."
                self.exerciseName = "Breathe"
            }
            else if predictedLabel == "hate" || predictedLabel == "anger" {
                processedPredictedLabel = "upset"
                processedPredictedDescription = "You are feeling upset. You may feel angry at someone or something.\n\nTake some time to stretch and release the stress, with the 'Stretch' exercise."
                self.exerciseName = "Stretch"
            }
            else {
                processedPredictedLabel = "OK"
                processedPredictedDescription = "You are feeling OK. Not great, but not bad either.\n\nTo boost your mood, you can try the 'Uplift' exercise."
                self.exerciseName = "Uplift"
            }
            
            self.predictedMood = processedPredictedLabel
            self.predictedMoodDescription = processedPredictedDescription
        }
    }
}
