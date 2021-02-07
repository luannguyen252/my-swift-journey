//
//  ContentView.swift
//  GuessTheNumber WatchKit Extension
//
//  Created by McCoy Zhu on 5/10/20.
//  Copyright © 2020 McCoy Zhu. All rights reserved.
//

import SwiftUI
import WatchKit
import UIKit

// MARK: - Extensions

extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: self as NSNumber)!
    }
}

extension View {
    func scaleToFitLine(_ lineLimit: Int? = 1) -> some View {
        self
            .scaledToFit()
            .minimumScaleFactor(0.001)
            .lineLimit(lineLimit ?? 1)
    }
}

extension UIImage {
    func resized(to size: CGSize, scaleMode: ContentMode? = nil, autoScaleForGraphicComplication: Bool = false) -> UIImage? {
        var finalSize: CGSize
        
        if scaleMode == nil {
            finalSize = size
        } else {
            let widthScale = self.size.width / size.width
            let heightScale = self.size.height / size.height
            
            if (scaleMode == ContentMode.fit && widthScale > heightScale) || (scaleMode == ContentMode.fill && widthScale < heightScale) {
                finalSize = CGSize(width: size.width, height: self.size.height / widthScale)
            } else {
                finalSize = CGSize(width: self.size.width / heightScale, height: size.height)
            }
        }
        
        if autoScaleForGraphicComplication && self.isSymbolImage && (size == CGSize(width: 84 / 2, height: 84 / 2) && WKInterfaceDevice.current().screenBounds.size.width == 324 / 2 || size == CGSize(width: 94 / 2, height: 94 / 2) && WKInterfaceDevice.current().screenBounds.size.width == 368 / 2) {
            finalSize = CGSize(width: finalSize.width * 0.72, height: finalSize.height * 0.72)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: (size.width - finalSize.width) / 2, y: (size.height - finalSize.height) / 2, width: finalSize.width, height: finalSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func applyingTint(_ tintColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        tintColor.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

extension Button {
    func buttonTint(_ color: Color) -> some View {
        Group {
            if #available(watchOSApplicationExtension 7.0, *) {
                self.buttonStyle(BorderedButtonStyle(tint: color))
            } else {
                self.accentColor(color)
            }
        }
    }
}

// MARK: - User Guessing View

struct UserGuessingView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        VStack {
            if self.data.userGuessedNumber == -1 {
                Spacer()
                
                Text(self.data.upperRange <= 1023 ? "Guess a number between 0 and \(self.data.upperRange.formatted())" : "Set the upper range lower than \(1024.formatted()) to play")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                if self.data.upperRange <= 1023 {
                    Button(action: {
                        withAnimation {
                            self.data.userGuessedNumber = 0
                        }
                        WKInterfaceDevice.current().play(.click)
                    }, label: {
                        Text("Ready")
                    })
                } else {
                    Button(action: {
                        self.data.isUserGuessing = false
                        WKInterfaceDevice.current().play(.click)
                    }, label: {
                        Text("OK")
                    })
                }
            } else {
                Picker(selection: self.$data.userGuessedNumber, label: EmptyView()) {
                    ForEach(0 ..< self.data.upperRange + 1) { index in
                        Text(index.formatted()).tag(index)
                            .font(.system(size: 22, weight: .medium, design: .rounded))
                            .scaleToFitLine()
                    }
                }
                
                Button(action: {
                    self.data.showCompareResult = true
                    self.data.userGuessedTimes += 1
                    self.data.userLastCheckedNumber = self.data.userGuessedNumber
                    if self.data.userGotCorrectNumber {
                        WKInterfaceDevice.current().play(.success)
                    } else {
                        WKInterfaceDevice.current().play(.click)
                    }
                }, label: {
                    Text("Confirm")
                })
            }
        }.navigationBarTitle(Text("Let Me Guess"))
        .alert(isPresented: self.$data.showCompareResult, content: {
            if self.data.userGotCorrectNumber {
                return Alert(title: Text("Yay"), message: Text("You get the number (\(self.data.userGuessingCorrectNumber.formatted())) in \(self.data.userGuessedTimes.formatted()) \(self.data.userGuessedTimes, specifier: "%d")!"), primaryButton: .default(Text("Quit"), action: {
                    if self.data.askWhenUserGuessing {
                        self.data.autoRedirect()
                        self.data.askWhenUserGuessing = false
                    } else {
                        self.data.isUserGuessing = false
                    }
                }), secondaryButton: .default(Text("Restart"), action: {
                    self.data.resetUserGuessing()
                    self.data.askWhenUserGuessing = false
                    currentAction = nil
                }))
            } else if self.data.askWhenUserGuessing {
                return Alert(title: Text("You have an unfinished game"), primaryButton: .default(Text("Quit"), action: {
                    self.data.autoRedirect()
                    self.data.askWhenUserGuessing = false
                }), secondaryButton: .default(Text("Resume"), action: {
                    self.data.askWhenUserGuessing = false
                    currentAction = nil
                    if self.data.userLastCheckedNumber == self.data.userGuessedNumber {
                        self.data.userLastCheckedNumber = -1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            self.data.showCompareResult = true
                        }
                    }
                }))
            } else {
                return Alert(title: Text(self.data.userGuessedNumber > self.data.userGuessingCorrectNumber ? "Try lower" : "Try higher"), message: Text("Trial: \(self.data.userGuessedTimes.formatted())"), dismissButton: .default(Text("OK"), action: {
                    self.data.userLastCheckedNumber = -1
                }))
            }
        })
    }
}

// MARK: - AI Guessing View

struct AiGuessingView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        VStack(alignment: .center) {
            if self.data.aiGuessedTimes == 0 {
                Spacer()
                
                Text("Choose a number between 0 and \(self.data.upperRange.formatted())")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.data.aiGuessedTimes += 1
                    }
                    WKInterfaceDevice.current().play(.click)
                }, label: {
                    Text("Ready")
                })
            } else {
                GeometryReader { geo in
                    ScrollView {
                        VStack(alignment: .center) {
                            Spacer()
                            
                            Text(self.data.aiGuessingLowerLimit == self.data.aiGuessingUpperLimit ? "It is \(self.data.aiGuessedNumber.formatted())!" : "Is it \(self.data.aiGuessedNumber.formatted())?")
                                .scaleToFitLine()
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                Button(action: {
                                    self.data.showAiResult = true
                                    self.data.hasAiWon = true
                                    WKInterfaceDevice.current().play(.success)
                                }, label: {
                                    Text("Correct")
                                }).buttonTint(.green)
                                
                                if self.data.aiGuessingLowerLimit != self.data.aiGuessedNumber {
                                    Button(action: {
                                        self.data.aiGuessedTimes += 1
                                        self.data.aiGuessingUpperLimit = self.data.aiGuessedNumber - 1
                                        self.data.aiGuessedNumber = Int((self.data.aiGuessingLowerLimit + self.data.aiGuessingUpperLimit + Int.random(in: 0 ... 1)) / 2)
                                    }, label: {
                                        Text("Too High")
                                    }).buttonTint(.red)
                                }
                                
                                if self.data.aiGuessingUpperLimit != self.data.aiGuessedNumber {
                                    Button(action: {
                                        self.data.aiGuessedTimes += 1
                                        self.data.aiGuessingLowerLimit = self.data.aiGuessedNumber + 1
                                        self.data.aiGuessedNumber = Int((self.data.aiGuessingLowerLimit + self.data.aiGuessingUpperLimit + Int.random(in: 0 ... 1)) / 2)
                                    }, label: {
                                        Text("Too Low")
                                    }).buttonTint(.red)
                                }
                            }
                        }
                        .animation(.default)
                        .frame(minWidth: geo.size.width, minHeight: geo.size.height)
                        .alert(isPresented: self.$data.showAiResult, content: {
                            if self.data.hasAiWon {
                                return Alert(title: Text("Hurray"), message: Text("AI gets the number (\(self.data.aiGuessedNumber.formatted())) in \(self.data.aiGuessedTimes.formatted()) \(self.data.aiGuessedTimes, specifier: "%d")!"), primaryButton: .default(Text("Quit"), action: {
                                    if self.data.askWhenAiGuessing {
                                        self.data.autoRedirect()
                                    } else {
                                        self.data.isAiGuessing = false
                                    }
                                    self.data.hasAiWon = false
                                }), secondaryButton: .default(Text("Restart"), action: {
                                    self.data.resetAiGuessing()
                                    self.data.hasAiWon = false
                                    currentAction = nil
                                }))
                            } else {
                                return Alert(title: Text("You have an unfinished game"), primaryButton: .default(Text("Quit"), action: {
                                    self.data.autoRedirect()
                                }), secondaryButton: .default(Text("Resume"), action: {
                                    currentAction = nil
                                }))
                            }
                        })
                    }
                }
            }
        }.navigationBarTitle(Text("Let AI Guess"))
    }
}

// MARK: - Randomizer View

struct RandomizerView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        VStack(spacing: 5) {
            NavigationLink(destination: RandomNumberView().environmentObject(guessData), isActive: self.$data.isRandomizingNumber, label: {
                HStack {
                    Image(systemName: "textformat.123")
                        .imageScale(.large)
                    Text("Number")
                }
            }).simultaneousGesture(TapGesture().onEnded{
                self.data.resetRandomNumber()
            })
            
            NavigationLink(destination: RandomColorView().environmentObject(guessData), isActive: self.$data.isRandomizingColor, label: {
                HStack {
                    Image(systemName: "paintbrush")
                        .imageScale(.large)
                    Text("Color")
                }
            }).simultaneousGesture(TapGesture().onEnded{
                self.data.resetRandomColor()
            })
            
            NavigationLink(destination: RandomBooleanView().environmentObject(guessData), isActive: self.$data.isRandomizingBoolean, label: {
                HStack {
                    Image(systemName: "questionmark.circle")
                        .imageScale(.large)
                    Text("Boolean")
                }
            }).simultaneousGesture(TapGesture().onEnded{
                self.data.resetRandomBoolean()
            })
        }.navigationBarTitle(Text("Randomizer"))
    }
}

// MARK: - Random Number View

struct RandomNumberView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(self.data.randomNumber.formatted())
                .font(.system(.largeTitle, design: .rounded))
                .scaleToFitLine()
            
            Spacer()
            
            Button(action: {
                self.data.resetRandomNumber()
                WKInterfaceDevice.current().play(.click)
            }, label: {
                Text("Randomize")
            })
        }.navigationBarTitle(Text("Number"))
    }
}

// MARK: - Random Color View

struct RandomColorView: View {
    @EnvironmentObject var data: GuessData
    
    func isColorTooBright() -> Bool {
        let maxC = [self.data.randomR, self.data.randomG, self.data.randomB].max()!
        let minC = [self.data.randomR, self.data.randomG, self.data.randomB].min()!
        return Double(maxC + minC) / 2 / 255 >= 0.53
    }
    
    var body: some View {
        VStack {
            Button(action: {
                self.data.usingHex.toggle()
                UserDefaults.standard.set(self.data.usingHex, forKey: "userPrefersUsingHex")
                WKInterfaceDevice.current().play(.click)
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: Double(self.data.randomR) / 255.0, green: Double(self.data.randomG) / 255.0, blue: Double(self.data.randomB) / 255.0))
                        .cornerRadius(8)
                    
                    Text(self.data.usingHex ? "#\(String(format: "%02X", self.data.randomR))\(String(format: "%02X", self.data.randomG))\(String(format: "%02X", self.data.randomB))" : "(\(self.data.randomR), \(self.data.randomG), \(self.data.randomB))")
                        .foregroundColor(isColorTooBright() ? .black : .white)
                        .animation(nil)
                }
            }).buttonStyle(PlainButtonStyle())
            
            Button(action: {
                withAnimation {
                    self.data.resetRandomColor()
                }
                WKInterfaceDevice.current().play(.click)
            }, label: {
                Text("Randomize")
            })
        }.navigationBarTitle(Text("Color"))
    }
}

// MARK: - Random Boolean View

struct RandomBooleanView: View {
    @EnvironmentObject var data: GuessData
    @Environment(\.locale) var locale: Locale
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text(self.data.randomDouble >= 0 ? "True" : "False")
                
                Image(systemName: self.data.randomDouble >= 0 ? (locale.languageCode == "ja" ? "circle" : "checkmark") : "xmark")
            }
            .font(.system(.largeTitle, design: .rounded))
            .foregroundColor(self.data.randomDouble >= 0 ? (locale.languageCode == "ja" ? .red : .green) : (locale.languageCode == "ja" ? .blue : .red))
            
            Spacer()
            
            Button(action: {
                self.data.resetRandomBoolean()
                WKInterfaceDevice.current().play(.click)
            }, label: {
                Text("Randomize")
            })
        }.navigationBarTitle(Text("Boolean"))
    }
}

// MARK: - Settings View

struct SettingsView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        List {
            if #available(watchOSApplicationExtension 7.0, *) {
                Button(action: {
                    self.data.promptMultiComplication = true
                }, label: {
                    HStack {
                        Text("Quick Action")
                        
                        Spacer()
                        
                        Image(systemName: "info")
                            .foregroundColor(.gray)
                    }
                }).padding(.vertical)
            } else {
                NavigationLink(destination: QuickActionSettingsView(pendingQuickAction: self.data.quickAction).environmentObject(guessData), isActive: self.$data.isEditingQuickAction, label: {
                    VStack(alignment: .leading) {
                        Text("Quick Action")
                        
                        Text(LocalizedStringKey(self.data.quickAction.rawValue))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }).padding(.vertical)
            }
            
            NavigationLink(destination: UpperRangeSettingsView(pendingUpperRange: self.data.upperRange).environmentObject(guessData), isActive: self.$data.isEditingUpperRange, label: {
                if self.data.upperRange < 10000 {
                    HStack {
                        Text("Upper Range for Numbers")
                        
                        Spacer()
                        
                        Text(self.data.upperRange.formatted())
                            .foregroundColor(.gray)
                    }
                } else {
                    VStack(alignment: .leading) {
                        Text("Upper Range for Numbers")
                        
                        Text(self.data.upperRange.formatted())
                            .foregroundColor(.gray)
                    }
                }
            }).padding(.vertical)
            
            Toggle(isOn: self.$data.usingHex) {
                Text("Use Hex Value for Colors")
            }
            .padding(.vertical)
            .onReceive([self.data.usingHex].publisher.first()) { _ in
                UserDefaults.standard.set(self.data.usingHex, forKey: "userPrefersUsingHex")}
            .onTapGesture(perform: {
                self.data.usingHex.toggle()
                UserDefaults.standard.set(self.data.usingHex, forKey: "userPrefersUsingHex")
            })
        }.navigationBarTitle(Text("Settings"))
        .alert(isPresented: self.$data.promptMultiComplication) {
            Alert(title: Text("GuessTheNumber now supports multiple complications"), message: Text("Choose you favorites and add them to your watch face!"), dismissButton: .default(Text("OK")))
        }
    }
}

// MARK: - Quick Action Settings View

struct QuickActionSettingsView: View {
    @EnvironmentObject var data: GuessData
    @State var pendingQuickAction: GuessData.QuickAction
    
    var body: some View {
        VStack {
            Picker(selection: self.$pendingQuickAction, label: EmptyView()) {
                ForEach(GuessData.QuickAction.allCases, id: \.self) { menu in
                    Text(LocalizedStringKey(menu.rawValue)).tag(menu)
                        .font(.system(.headline, design: .rounded))
                        .scaleToFitLine()
                }
            }
            
            Button(action: {
                self.data.isEditingQuickAction = false
                self.data.quickAction = self.pendingQuickAction
                UserDefaults.standard.set(self.pendingQuickAction.rawValue, forKey: "userSetQuickAction")
                WKInterfaceDevice.current().play(.click)
            }, label: {
                Text("Done")
            })
        }.navigationBarTitle(Text("Quick Action"))
    }
}

// MARK: - Upper Range Keyboard

struct UpperRangeKeyboard: View {
    @EnvironmentObject var data: GuessData
    @Binding var pendingUpperRange: Int
    @State var geoProxy: GeometryProxy
    
    var body: some View {
        VStack(spacing: 3) {
            Text("\(self.pendingUpperRange.formatted())")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .frame(width: self.geoProxy.size.width, height: (self.geoProxy.size.height - 12) / 5)
                .scaleToFitLine()
                .background(Color.black)
                .onLongPressGesture(minimumDuration: 0.4) {
                    let previousUpperRange = UserDefaults.standard.integer(forKey: "userSetUpperRange")
                    if previousUpperRange != 0 {
                        WKInterfaceDevice.current().play(.click)
                        self.pendingUpperRange = previousUpperRange
                    }
                }
                .simultaneousGesture(DragGesture().onEnded({ value in
                    if value.translation.width < 0 {
                        if -value.translation.width < self.geoProxy.size.width * 0.7 {
                            self.pendingUpperRange /= 10
                        } else {
                            self.pendingUpperRange = 0
                        }
                        
                        if self.pendingUpperRange == 0 {
                            WKInterfaceDevice.current().play(.click)
                        }
                    }
                }))
            
            ForEach(0 ..< 3) { row in
                HStack(spacing: 3) {
                    ForEach(0 ..< 3) { col in
                        Button(action: {
                            if !(self.pendingUpperRange >= 100000000) {
                                self.pendingUpperRange *= 10
                                self.pendingUpperRange += (row * 3 + col + 1)
                            }
                            if self.pendingUpperRange >= 100000000 {
                                WKInterfaceDevice.current().play(.click)
                            }
                        }, label: {
                            Text("\((row * 3 + col + 1).formatted())")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.medium)
                                .scaleEffect(0.69)
                                .opacity(self.pendingUpperRange >= 100000000 ? 0.5 : 1)
                                .frame(width: (self.geoProxy.size.width - 6) / 3, height: (self.geoProxy.size.height - 12) / 5)
                                .background(Color(red: 34.0 / 255.0, green: 34.0 / 255.0, blue: 35.0 / 255.0))
                                .cornerRadius(5)
                        }).buttonStyle(PlainButtonStyle())
                    }
                }
            }
            
            HStack(spacing: 3) {
                Button(action: {
                    if self.pendingUpperRange <= 1023 {
                        self.data.resetUpperRange(self.pendingUpperRange, shouldStore: true)
                        self.data.isEditingUpperRange = false
                        WKInterfaceDevice.current().play(.click)
                    } else {
                        self.data.warnUpperRange = true
                        WKInterfaceDevice.current().play(.retry)
                    }
                }, label: {
                    Text(verbatim: "OK")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.semibold)
                        .scaleEffect(0.65)
                        .foregroundColor(.green)
                        .frame(width: (self.geoProxy.size.width - 6) / 3, height: (self.geoProxy.size.height - 12) / 5)
                        .background(Color.black)
                })
                .disabled(self.pendingUpperRange == 0)
                .buttonStyle(PlainButtonStyle())
                .alert(isPresented: self.$data.warnUpperRange, content: {
                    Alert(title: Text("“Let Me Guess” only supports numbers lower than \(1024.formatted())"), primaryButton: .cancel(Text("OK"), action: {
                        self.data.resetUpperRange(self.pendingUpperRange, shouldStore: true)
                        self.data.isEditingUpperRange = false
                    }), secondaryButton: .cancel())
                })
                
                Button(action: {
                    if !(self.pendingUpperRange >= 100000000 || self.pendingUpperRange == 0) {
                        self.pendingUpperRange *= 10
                    }
                    if self.pendingUpperRange >= 100000000 {
                        WKInterfaceDevice.current().play(.click)
                    }
                }, label: {
                    Text("\(0.formatted())")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.medium)
                        .scaleEffect(0.69)
                        .opacity(self.pendingUpperRange >= 100000000 || self.pendingUpperRange == 0 ? 0.5 : 1)
                        .frame(width: (self.geoProxy.size.width - 6) / 3, height: (self.geoProxy.size.height - 12) / 5)
                        .background(Color(red: 34.0 / 255.0, green: 34.0 / 255.0, blue: 35.0 / 255.0))
                        .cornerRadius(5)
                }).buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    self.pendingUpperRange /= 10
                    if self.pendingUpperRange == 0 {
                        WKInterfaceDevice.current().play(.click)
                    }
                }, label: {
                    Image(systemName: "delete.left.fill")
                        .font(.title)
                        .scaleEffect(0.53)
                        .foregroundColor(.red)
                        .frame(width: (self.geoProxy.size.width - 6) / 3, height: (self.geoProxy.size.height - 12) / 5)
                        .background(Color.black)
                })
                .disabled(self.pendingUpperRange == 0)
                .buttonStyle(PlainButtonStyle())
                .simultaneousGesture(LongPressGesture(minimumDuration: 0.4).onEnded({ _ in
                    if self.pendingUpperRange != 0 {
                        self.pendingUpperRange = 0
                        WKInterfaceDevice.current().play(.click)
                    }
                }))
            }
        }.navigationBarTitle(Text("Upper Range"))
    }
}

// MARK: - Upper Range Settings View

struct UpperRangeSettingsView: View {
    @EnvironmentObject var data: GuessData
    @State var pendingUpperRange: Int
    
    var body: some View {
        GeometryReader { geo in
            UpperRangeKeyboard(pendingUpperRange: self.$pendingUpperRange, geoProxy: geo).environmentObject(guessData)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

// MARK: - Content View

struct ContentView: View {
    @EnvironmentObject var data: GuessData
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 5) {
                    NavigationLink(destination: UserGuessingView().environmentObject(guessData), isActive: self.$data.isUserGuessing, label: {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .imageScale(.large)
                            Text("Let Me Guess")
                        }
                    }).simultaneousGesture(TapGesture().onEnded{
                        self.data.resetUserGuessing()
                    })
                    
                    NavigationLink(destination: AiGuessingView().environmentObject(guessData), isActive: self.$data.isAiGuessing, label: {
                        HStack {
                            Image(systemName: "gamecontroller.fill")
                                .imageScale(.large)
                            Text("Let AI Guess")
                        }
                    }).simultaneousGesture(TapGesture().onEnded{
                        self.data.resetAiGuessing()
                    })
                    
                    NavigationLink(destination: RandomizerView().environmentObject(guessData), isActive: self.$data.isInRandomizer, label: {
                        HStack {
                            Image(systemName: "dial.fill")
                                .imageScale(.large)
                            Text("Randomizer")
                        }
                    })
                    
                    NavigationLink(destination: SettingsView().environmentObject(guessData), isActive: self.$data.isInSettings, label: {
                        HStack {
                            Image(systemName: "gear")
                                .imageScale(.large)
                            Text("Settings")
                        }
                    })
                }
                .frame(minHeight: geo.size.height)
                .navigationBarTitle(Text("Guess"))
                .alert(isPresented: self.$data.warnMultiComplication) {
                    Alert(title: Text("GuessTheNumber now supports multiple complications"), message: Text("Choose you favorites and add them to your watch face!"), dismissButton: .default(Text("OK"), action: {
//                        self.data.quickAction = .none
                    }))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(guessData)
    }
}
