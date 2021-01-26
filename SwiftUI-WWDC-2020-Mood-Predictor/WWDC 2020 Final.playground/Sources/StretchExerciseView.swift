import Foundation
import SwiftUI
import AVFoundation
import PlaygroundSupport
import UIKit

public struct StretchExerciseView : View {
    // BINDING VAR FOR HIDING/SHOWING NAVIGATION BAR
    @Binding var isNavigationBarHidden : Bool;
    
    public init(_ isNavigationBarHidden: Binding<Bool>) {
        self._isNavigationBarHidden = isNavigationBarHidden
    }
    
    // STATE FOR LABELS THAT WILL BE SHOWN
    @State var mainLabel = "GET STARTED";
    @State var subLabel = "Start a short stretching exercise.";
    @State var imageName = "";
    
    // TIMERS FOR CHANING STRETCHING EXERCISE
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var counter = 3;
    
    // STATE FOR WHETHER BREATHING ACTIVITY HAS STARTED YET
    @State var isActive = false;
    
    // STATE FOR DETERMINING WHETHER SHEET IS SHOWN
    @State var isSheetShown = false;
    
    let speechSynthesizer = AVSpeechSynthesizer();

    public var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .center) {
                Text(self.mainLabel)
                    .kerning(1.4)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                Text(self.subLabel)
                    .kerning(1.4)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 200)
                    .lineLimit(5)
                    .onReceive(timer) { _ in
                        if self.isActive == false {
                            return;
                        }
                        if self.counter < 50 {
                            self.counter += 1;
                            
                            // AFTER 8 SECONDS
                            if(self.counter == 12) {
                                self.mainLabel = "STRETCH";
                                self.subLabel = "Hold your right arm out straight, and hug it to your chest with your left arm."
                                
                                let speechUtterance = AVSpeechUtterance(string: "Hold your right arm out straight, and hug it to your chest with your left arm.");
                                speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                                self.speechSynthesizer.speak(speechUtterance)
                                
                                self.imageName = "ArmStretchingImage.png"
                            }
                            if(self.counter == 22) {
                                // RUN SECOND STRETCH
                                self.mainLabel = "STRETCH";
                                self.subLabel = "Now, hold your left arm out straight, and hug it to your chest with your right arm."
                                
                                let speechUtterance = AVSpeechUtterance(string: "Now, hold your left arm out straight, and hug it to your chest with your right arm.");
                                speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                                self.speechSynthesizer.speak(speechUtterance)
                            }
                            else if(self.counter == 30) {
                                self.mainLabel = "STRETCH";
                                self.subLabel = "Now, slowly turn your head in a circle. Be sure to breathe consistently while stretching."
                                
                                let speechUtterance = AVSpeechUtterance(string: "Now, slowly turn your head in a circle. Be sure to breathe consistently while stretching.");
                                speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                                self.speechSynthesizer.speak(speechUtterance)
                                
                                self.imageName = ""
                            }
                            else if(self.counter == 38) {
                                self.mainLabel = "STRETCH";
                                self.subLabel = "In the future, when feeling angry or upset, taking some time to stretch can help manage these emotions, and allow you to calm down and think."
                                
                                let speechUtterance = AVSpeechUtterance(string: "In the future, when feeling angry or upset, taking some time to stretch can help manage these emotions, and allow you to calm down and think.");
                                speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                                self.speechSynthesizer.speak(speechUtterance)
                            }
                        }
                        else {
                            self.isActive = false;
                            self.mainLabel = "GET STARTED";
                            self.subLabel = "Start a short stretching exercise.";
                            self.isSheetShown = true;
                        }
                    }
                
                // IF EXERCISE IS NOT IN PROGRESS, SHOW GET STARTED BUTTON
                if isActive == false {
                    VStack(alignment: .center) {
                        Button(action: {
                            self.isActive = true;
                            self.mainLabel = "LET'S BEGIN";
                            self.subLabel = "Focus on your breathing.";
                            
                            let speechUtterance = AVSpeechUtterance(string: "Focus on your breathing. Allow these stretches to bring you calmness and peace.");
                            speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                            self.speechSynthesizer.speak(speechUtterance)
                        }) {
                            Text("Get Started")
                                .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.7))
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                        }
                        .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.5))
                        .cornerRadius(5)
                        .accessibility(value: Text("Begin"))
                        .accessibility(hint: Text("Starts stretching exercise."))
                    }
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    .animation(.easeInOut)
                }
                
                if imageName != "" {
                    Image(uiImage: UIImage(named: self.imageName)!)
                    .resizable()
                    .frame(width: 250, height: 200)
                    .animation(.easeInOut)
                    .transition(.slide)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 255 / 255, green: 224 / 255, blue: 224 / 255), Color(red: 74 / 255, green: 110 / 255, blue: 128 / 255)]), startPoint: .bottom, endPoint: .top))
        .animation(.easeInOut)
        .onAppear {
            self.isNavigationBarHidden = false;
        }
        .onDisappear {
            self.isActive = false;
        }
        // FINISHED INFO SHEET
        .sheet(isPresented: $isSheetShown, content: { FinishStretchSheetView(self.$isSheetShown) })
    }
}

struct FinishStretchSheetView : View {
    @Binding var isSheetShown: Bool
    
    public init(_ isSheetShown: Binding<Bool>) {
        self._isSheetShown = isSheetShown
    }

    
    public var body : some View {
        VStack {
            VStack(alignment: .leading) {
                // DISPLAY THE MAIN ONBOARDING IMAGE
                // IMAGE CREDITS: UNDRAW.CO
                VStack(alignment: .center) {
                    Image(uiImage: UIImage(named: "YogaImage.png")!)
                    .resizable()
                    .frame(width: 235, height: 200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                
                // BOTTOM SECTION, FOR HEADING, DESCRIPTION, AND GET STARTED BUTTON
                VStack(alignment: .leading) {
                    // HEADING
                    Text("Stretching")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    // DESCRIPTION OF PLAYGROUND
                    Text("In the future, when feeling upset or angry, stretching can be beneficial. It can help release some stress, and can be a good time to collect your thoughts.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .lineSpacing(15)
                        .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.6))
                        .padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 30))
                    
                    // USE SPACER TO MOVE GOT IT BUTTON TO BOTTOM
                    Spacer()
                    
                    // CONTAINER WITH GOT IT BUTTON
                    VStack(alignment: .center) {
                        Button(action: {self.isSheetShown = false}) {
                            Text("Got It!")
                                .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                                .foregroundColor(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.9))
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                        }
                        .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.1))
                        .cornerRadius(5)
                        .accessibility(value: Text("Got It"))
                        .accessibility(hint: Text("Closes pop up sheet."))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

