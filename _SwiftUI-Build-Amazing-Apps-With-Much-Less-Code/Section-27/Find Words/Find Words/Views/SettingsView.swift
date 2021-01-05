//
//  SettingsView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/8/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    //UserSettings instance
    @ObservedObject var settings = UserSettings()
    
    //dismiss the SettingsView
    @Environment(\.presentationMode) var presentationMode
    
    //haptic feedback
       var hapticImpact = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        VStack {
            Text("Language Settings")
                .font(.title)
                .padding(.top, 20)
            Form {
                Section(header: Text("Select a language")) {
                    VStack(alignment: .center, spacing: 10) {
                        HStack {
                            //english button
                            Button(action: {
                                self.hapticImpact.impactOccurred()
                                self.settings.englishIsOn = true
                                self.settings.spanishIsOn = false
                                self.settings.italianIsOn = false
                            }){
                                buttonBackgroundAndText(buttonText: "English")
                            }.buttonStyle(ButtonFlash())
                            
                            Spacer()
                            
                            //english - checkmark appears if true
                            addCheckmark(isLanguageOn: settings.englishIsOn)
                            //english flag
                            Image("engFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        
                        Divider()
                        
                        HStack {
                            //spanish button
                            Button(action: {
                                self.hapticImpact.impactOccurred()
                                self.settings.englishIsOn = false
                                self.settings.spanishIsOn = true
                                self.settings.italianIsOn = false
                            }){
                                buttonBackgroundAndText(buttonText: "Spanish")
                            }.buttonStyle(ButtonFlash())
                            
                            Spacer()
                            
                            //spanish - checkmark appears if true
                            addCheckmark(isLanguageOn: settings.spanishIsOn)
                            //spanish flag
                            Image("esFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        
                        Divider()
                        
                        HStack {
                            //italian button
                            Button(action: {
                                self.hapticImpact.impactOccurred()
                                self.settings.englishIsOn = false
                                self.settings.spanishIsOn = false
                                self.settings.italianIsOn = true
                            }){
                                buttonBackgroundAndText(buttonText: "Italian")
                            }.buttonStyle(ButtonFlash())
                            
                            Spacer()
                            
                            //italian - checkmark appears if true
                            addCheckmark(isLanguageOn: settings.italianIsOn)
                            //italian flag
                            Image("itFlag").resizable()
                                .border(Color.black, width: 1.5)
                                .frame(width: 50, height: 30)
                        }
                        
                        Divider()
                    }.animation(.easeOut)
                }
                //MARK: - DISMISS BUTTON
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Done")
                                .padding(.horizontal, 5)
                        }.padding(8)
                            .shadow(color: .black, radius: 1, x: 1, y: 1)
                    }.foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(20).shadow(color: .black, radius: 1, x: 1, y: 1)
                        .buttonStyle(ButtonFlash())
                    
                    Spacer()
                }
            }
        }
    }
}

//add the button background and text
struct buttonBackgroundAndText: View {
    var buttonText = ""
    var body: some View {
        ZStack {
            Image("background").resizable()
                .renderingMode(.original)
                .frame(width: 70, height: 35)
                .cornerRadius(10)
            
            Text(buttonText)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }
    }
}

//add checkmark
struct addCheckmark: View {
    var isLanguageOn: Bool = false
    var body: some View {
        VStack{
            Image(systemName: "checkmark.circle")
                .imageScale(.small).foregroundColor(.green)
                .font(Font.largeTitle.weight(.regular))
                .opacity(self.isLanguageOn ? 1.0 : 0)
        }
    }
}

struct ButtonFlash: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .shadow(color: .black, radius: 2, x: 2, y: 2)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
