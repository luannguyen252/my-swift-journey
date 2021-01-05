//
//  ContentView.swift
//  Dog Breed ID
//
//  Created by Stephen DeStefano on 9/24/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var defaults = UserDefaults.standard
    @State private var topPrediction = ""
    @State private var secondPrediction = ""
    @State private var topConfidence = ""
    @State private var secondConfidence = ""
    
    @State private var showImagePicker: Bool = false
    @State private var img: Image? = nil
    @State private var placeholderIsShown = true
    
    var body: some View {
        
        VStack {
            VStack {
                //title
                Text("Dog Breed ID")
                    .font(.custom("Charter Italic", size: 34))
                    .foregroundColor(.white)
            }.padding(.bottom)
            
            //placeholder and user selected image
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(UIColor.systemGreen), lineWidth: 4)
                        .frame(width: 350, height: 250)
                    
                    //the user selected image will go here
                    img?.resizable()
                        .scaledToFit()
                        .padding()
                    
                    //placeholder image
                    if placeholderIsShown {
                        Image("dogPlaceholder")
                            .scaleEffect(0.7)
                            .cornerRadius(20)
                            .shadow(color: .white, radius: 3)
                    } else {
                        Image("dogPlaceholder")
                            .frame(width: 500, height: 200).hidden()
                    }
                }
            }
            
            Spacer()
            
            //prediction labels stack
            VStack {
                Text("Top Prediction & Confidence:").font(.custom("Charter Italic", size: 22))
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(UIColor.systemOrange), lineWidth: 2)
                    .frame(width: 350, height: 60)
                    .overlay(Text(" " + self.topPrediction + self.topConfidence)
                        .padding(5)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .font(.title))
                        .padding(.bottom)
                    .padding(.bottom)
                
                Text("Second Prediction & Confidence:")
                    .font(.custom("Charter Italic", size: 22))
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(UIColor.systemOrange), lineWidth: 2)
                    .frame(width: 350, height: 60)
                    .overlay(Text(" " + self.secondPrediction + self.secondConfidence)
                        .padding(5)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .font(.title))
            }.foregroundColor(.white)
            .padding()
            
            //button stack
            VStack {
                HStack(spacing: 30) {
                    
                    //library button
                    Button(action: {
                        //code to access the photo library
                        self.topPrediction = ""
                        self.secondPrediction = ""
                        self.topConfidence = ""
                        self.secondConfidence = ""
                        self.showImagePicker = true
                        self.placeholderIsShown = false
                    }){
                        Image(systemName: "photo.on.rectangle")
                        Text("Library")
                            .padding(.horizontal)
                    }.padding()
                        .foregroundColor(Color.black)
                        .background(Color(UIColor.systemGreen))
                        .cornerRadius(25)
                    
                    //predict button
                    Button(action: {
                        //code to populate the text views with predictions
                         self.topPrediction = UserDefaults.standard.string(forKey: "topPrediction") ?? "No Prediction Available"
                         self.secondPrediction = UserDefaults.standard.string(forKey: "secondPrediction") ?? "No Prediction Available"
                         self.topConfidence = UserDefaults.standard.string(forKey: "topConfidence") ?? "No Confidence Available"
                         self.secondConfidence = UserDefaults.standard.string(forKey: "secondConfidence") ?? "No Confidence Available"
                    }){
                        Image(systemName: "questionmark.square.fill")
                        Text("Predict")
                            .padding(.horizontal)
                    }.padding()
                        .foregroundColor(Color.black)
                        .background(Color(UIColor.systemOrange))
                        .cornerRadius(25)
                }
            }
            .sheet(isPresented: self.$showImagePicker) {
                ImagePicker(isShown: self.$showImagePicker, image: self.$img)
            }
        }.background(Image("background").edgesIgnoringSafeArea([.all]))
            .padding()
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
