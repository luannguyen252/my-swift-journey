/*:
 # WWDC 2020: Mood Predictor, by Jake Short
 
 This playground focuses on an important topic in our society: mental health. Learning about and managing your emotions is a vital step in ensuring good mental health. In this playground, you can use the mood predictor to type out a sentence, and an ML model, using **NaturalLanguage**, will detect what emotions you are feeling.
 
 ---
 ## Instructions
  1. Start with the Mood Recognizer to get a recommended activity.
  2. Next, you can explore all the available activities.
 ---
 
 Based on the results from the ML model, the playground will recommend you one of four activities:
 
 - `Breathe`. A short, 20 second guided breathing activity. Focusing on breathing can help calm down when feeling stress.
 - `Relax`. A calming song plays for 20 seconds. Music can help with relaxing in stressful situations, and can allow you to relax when you have been working hard.
 - `Uplift`. This activity reads motivational quotes to lift your spirits and get you motivated.
 - `Stretch`. A stretching exercise which can help calm down when feeling upset or overwhelming emotions.
 
 ---
 
 
 ## Sources
 - `MoodPredictorView`: Prompts user for input, then uses **NaturalLanguage** and **ML** to determine the emotion present in the input. Then, a recommended activity is given to the user.
 - `StartupSheet`: Displays a short description when the playground is run.
 - `BreatheExerciseView`: Displays the breathing exercise view. Uses **AVFoundation** for Speech Synthesis. Timers are used to control the growing and shrinking circle.
 - `RelaxExerciseView`: Plays a calming and relaxing song using **AVFoundation**. Timers are used to control the shrinking circle.
 - `UpliftExerciseView`: Reads motivational and uplifting quotes out loud using **AVFoundation** and Speech Synthesis.
 - `StretchExerciseView`: Guided stretching, using **AVFoundation** for Speech Synthesis.
 ---
 
 
 ## Resources
 - Song on "Relax" exercise is: "Dream Culture" Kevin MacLeod (incompetech.com) [CC](https://creativecommons.org/licenses/by/4.0/)
 
 - Illstrations on a variety of pages are courtesy of https://undraw.co
 
 - Image on stretch exercise is from pexels.com
*/

import UIKit
import SwiftUI
import PlaygroundSupport

func getHeaderText() -> String {
    let calendarObject = Calendar.current;
    let dateObject = Date();
    let currentHour = calendarObject.component(.hour, from: dateObject);
    
    // Time is from midnight to noon
    if(currentHour > 0 && currentHour < 12) {
        return "Good\nMorning"
    }
    // Time is from noon to 7
    else if(currentHour >= 12 && currentHour < 19) {
        return "Good\nAfternoon"
    }
    // Else (time is from 7 to midnight)
    else {
        return "Good\nEvening"
    }
}

struct MainView : View {
    // BOOL FOR WHETHER STARTUP/GET STARTED MODAL IS SHOWN
    @State var isStartupPresented = true;
    // BAR IS HIDDEN ON HOME PAGE, BUT NOT ON OTHERS
    @State var isNavigationBarHidden = true;
    
    // RETRIEVE WELCOME TEXT TO DISPLAY (SEE ABOVE)
    let headerText = getHeaderText()
    
    init() {
        // SET NAVIGATION BAR COLOR TO BLUE, HIDE UNDERLINE/SHADOW
        UINavigationBar.appearance().barTintColor = UIColor(red: 89 / 255, green: 120 / 255, blue: 136 / 255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body : some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(headerText)
                            .kerning(0.75)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                            .lineSpacing(12)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recommended")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.7))
                            
                        NavigationLink(destination: MyMoodView(self.$isNavigationBarHidden)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Mood Recognizer")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .foregroundColor(Color.white)
                                    Text("ML recognizes your mood, and gives you recommendations.")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                        .lineLimit(2)
                                }
                                
                                Image(systemName: "wand.and.stars")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        }
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(Color(red: 224 / 255, green: 86 / 255, blue: 253 / 255, opacity: 0.6))
                        .cornerRadius(7)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .shadow(radius: 3)
                        .accessibility(label: Text("Mood Recognizer"))
                        
                        Text("All Exercises")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.7))
                        
                        NavigationLink(destination: BreatheExerciseView(self.$isNavigationBarHidden)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Breathe")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .foregroundColor(Color.white)
                                    Text("A short, guided breathing exercise.")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                }
                                
                                Image(systemName: "wind")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.6))
                        .cornerRadius(7)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .shadow(radius: 3)
                        .accessibility(label: Text("Breathing Exercise"))
                        
                        NavigationLink(destination: RelaxExerciseView(self.$isNavigationBarHidden)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Relax")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .foregroundColor(Color.white)
                                    Text("Calm music for relaxation.")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                }
                                
                                Image(systemName: "moon.stars")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 9 / 255, green: 132 / 255, blue: 227 / 255, opacity: 0.6))
                        .cornerRadius(7)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                        .shadow(radius: 3)
                        .accessibility(label: Text("Relaxing Exercise"))
                        
                        NavigationLink(destination: UpliftExerciseView(self.$isNavigationBarHidden)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Uplift")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .foregroundColor(Color.white)
                                    Text("Uplifting, motivational quotes.")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                }
                                
                                Image(systemName: "quote.bubble")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 180 / 255, green: 80 / 255, blue: 123 / 255, opacity: 0.6))
                        .cornerRadius(7)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                        .shadow(radius: 3)
                        .accessibility(label: Text("Uplifting Exercise"))
                        
                        NavigationLink(destination: StretchExerciseView(self.$isNavigationBarHidden)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text("Stretch")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .foregroundColor(Color.white)
                                    Text("Short stretching exercise.")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                }
                                
                                Image(systemName: "burst")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            }
                            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 80 / 255, green: 170 / 255, blue: 123 / 255, opacity: 0.6))
                        .cornerRadius(7)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 20))
                        .shadow(radius: 3)
                        .accessibility(label: Text("Stretching Exercise"))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            // DISABLE/HIDE NAVIGATION BAR
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(self.isNavigationBarHidden)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                self.isNavigationBarHidden = true;
            }
        }
        // STARTUP/GET STARTED SHEET
        .sheet(isPresented: $isStartupPresented, content: { StartupView(self.$isStartupPresented) })
    }
}

PlaygroundPage.current.setLiveView(MainView())
