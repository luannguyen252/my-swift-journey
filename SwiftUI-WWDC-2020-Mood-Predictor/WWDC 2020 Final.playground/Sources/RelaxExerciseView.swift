import Foundation
import SwiftUI
import AVFoundation

/*
 The music used is as follows:
 
"Dream Culture" Kevin MacLeod (incompetech.com), under CC by 4.0
http://creativecommons.org/licenses/by/4.0/

*/
var player: AVAudioPlayer?
func playSong() {
    guard let url = Bundle.main.url(forResource: "DreamCulture", withExtension: "mp3") else {return}
    
    do {
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        guard let player = player else {return}
        
        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}

func stopSong() {
    guard let player = player else {return}
    
    player.stop()
}

public struct RelaxExerciseView : View {
    // BINDING VAR FOR HIDING/SHOWING NAVIGATION BAR
    @Binding var isNavigationBarHidden : Bool;
    
    public init(_ isNavigationBarHidden: Binding<Bool>) {
        self._isNavigationBarHidden = isNavigationBarHidden
    }
    
    // STATE FOR TIMER AND CIRCLE SIZE MANAGEMENT
    @State var timeRemaining = 20;
    @State var timerCircleSize : CGFloat = 150;
    
    // STATE FOR LABELS THAT WILL BE SHOWN
    @State var mainLabel = "GET STARTED";
    @State var subLabel = "Start a short, 20 second relaxation exercise.";
    
    // STATE FOR WHETHER BREATHING ACTIVITY HAS STARTED YET
    @State var isActive = false;
    
    // STATE FOR DETERMINING WHETHER SHEET IS SHOWN
    @State var isSheetShown = false;
    
    // TIMERS FOR INCREASING/DECREASING TIME, AND DECREASING CIRCLE SIZE
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let circleSizeTimer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()

    public var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("\(timeRemaining)")
                        .foregroundColor(Color.white)
                        .font(.system(size: (timerCircleSize / 6), weight: .heavy, design: .rounded))
                        .accessibility(value: Text("\(timeRemaining) seconds"))
                        // Change displayed timer value every second
                        .onReceive(timer) { _ in
                            if self.isActive == false {
                                return;
                            }
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1;
                            }
                            else if self.timeRemaining == 0 {
                                self.isActive = false;
                                self.timeRemaining = 20;
                                self.timerCircleSize = 150;
                                self.mainLabel = "GET STARTED";
                                self.subLabel = "Start a short, 20 second relaxation exercise.";
                                self.isSheetShown = true;
                                stopSong()
                            }
                        }
                }
                .frame(width: timerCircleSize, height: timerCircleSize, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 255 / 255, green: 224 / 255, blue: 224 / 255), Color(red: 74 / 255, green: 110 / 255, blue: 128 / 255)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(timerCircleSize)
                .shadow(color: Color(red: 74 / 255, green: 110 / 255, blue: 128 / 255).opacity(0.45), radius: 12, x: -10, y: 10)
                .shadow(color: Color(red: 255 / 255, green: 224 / 255, blue: 224 / 255).opacity(0.45), radius: 12, x: 10, y: -10)
                .animation(.easeInOut)
                // Decrease size of circle
                .onReceive(circleSizeTimer) { _ in
                    if self.isActive == false {
                        return;
                    }
                    if self.timeRemaining > 0 {
                        self.timerCircleSize -= 1;
                    }
                }
            }
            .frame(width: 200, height: 200, alignment: .center)
            
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

            // IF EXERCISE IS NOT IN PROGRESS, SHOW GET STARTED BUTTON
            if isActive == false {
                VStack(alignment: .center) {
                    Button(action: {
                        self.isActive = true;
                        self.mainLabel = "RELAX";
                        self.subLabel = "Close your eyes, and focus on the good things in life.";
                        playSong()
                    }) {
                        Text("Get Started")
                            .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                            .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.7))
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.5))
                    .cornerRadius(5)
                    .accessibility(value: Text("Begin"))
                    .accessibility(hint: Text("Starts 20 second relaxation exercise."))
                }
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                .animation(.easeInOut)
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
            stopSong();
        }
        // FINISHED INFO SHEET
        .sheet(isPresented: $isSheetShown, content: { FinishRelaxSheetView(self.$isSheetShown) })
    }
}

struct FinishRelaxSheetView : View {
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
                    Image(uiImage: UIImage(named: "MusicImage.png")!)
                    .resizable()
                    .frame(width: 300, height: 200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                
                // BOTTOM SECTION, FOR HEADING, DESCRIPTION, AND GET STARTED BUTTON
                VStack(alignment: .leading) {
                    // HEADING
                    Text("Music")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    // DESCRIPTION OF PLAYGROUND
                    Text("In the future, when wanting to relax and do some thinking, such as when feeling overwhelmed, listening to music can be a very helpful activity.")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
