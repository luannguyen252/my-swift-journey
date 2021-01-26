import Foundation
import SwiftUI
import AVFoundation
import PlaygroundSupport
import UIKit

public struct UpliftExerciseView : View {
    // BINDING VAR FOR HIDING/SHOWING NAVIGATION BAR
    @Binding var isNavigationBarHidden : Bool;
    
    public init(_ isNavigationBarHidden: Binding<Bool>) {
        self._isNavigationBarHidden = isNavigationBarHidden
    }
    
    // STATE FOR LABELS THAT WILL BE SHOWN
    @State var mainLabel = "GET STARTED";
    @State var subLabel = "Start a short, motivational exercise.";
    
    // TIMERS FOR CHANGING QUOTES
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    @State var numTimesRun = 3;
    
    // STATE FOR WHETHER BREATHING ACTIVITY HAS STARTED YET
    @State var isActive = false;
    
    var motivationalQuotes = ["'Everything you can imagine is real.' - Pablo Picasso",
                              "'People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do.' - Rob Siltanen",
                              "'We May Encounter Many Defeats But We Must Not Be Defeated.' - Maya Angelou",
                              "'The Man Who Has Confidence In Himself Gains The Confidence Of Others.' - Hasidic Proverb",
                              "'Things Work Out Best For Those Who Make The Best Of How Things Work Out.' - John Wooden"]
    
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
                        if self.numTimesRun > 0 {
                            self.numTimesRun -= 1;
                            self.subLabel = self.motivationalQuotes[self.numTimesRun];
                            
                            let speechUtterance = AVSpeechUtterance(string: self.motivationalQuotes[self.numTimesRun]);
                            //speechUtterance.rate = 0.75;
                            speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                            self.speechSynthesizer.speak(speechUtterance)
                        }
                        else {
                            self.isActive = false;
                            self.mainLabel = "GET STARTED";
                            self.subLabel = "Start a short, motivational exercise.";
                        }
                    }
                
                // IF EXERCISE IS NOT IN PROGRESS, SHOW GET STARTED BUTTON
                if isActive == false {
                    VStack(alignment: .center) {
                        Button(action: {
                            self.isActive = true;
                            self.mainLabel = "READ THE QUOTES";
                            self.subLabel = "If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You.' - Steve Jobs"
                            
                            let speechUtterance = AVSpeechUtterance(string: "If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You.' - Steve Jobs");
                            //speechUtterance.rate = 0.75;
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
                        .accessibility(hint: Text("Starts uplifting exercise."))
                    }
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    .animation(.easeInOut)
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
    }
}
