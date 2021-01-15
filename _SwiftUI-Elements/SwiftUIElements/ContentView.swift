//
//  ContentView.swift
//  SwiftUIElements
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = 0.7
    @State private var greenValue = 0.5
    @State private var blueValue = 0.7

    @State private var showSliders: Bool = false

    @State private var likeCount = 0

    let imageNames = ["alex1", "alex2", "alex3", "alex4"]
    @State private var currentImageName = "alex1"

    @State private var titleText = ""

    @State private var currentCornerRadius = 0
    let cornerRadiuses = [0, 20, 40]
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: Thumbnail View
                ThumbnailView(redValue: $redValue, greenValue: $greenValue, blueValue: $blueValue, currentCornerRadius: $currentCornerRadius, titleText: $titleText, likeCount: $likeCount, currentImageName: $currentImageName)
                
                // MARK: Form
                Form {
                    Section {
                        // Form Section 1
                        // MARK: Text Field
                        TextField("Title goes here", text: $titleText)
                        
                        // MARK: Segmented Control
                        SegmentedPickerView(currentCornerRadius: $currentCornerRadius, cornerRadiuses: cornerRadiuses)
                        // MARK: Toggle
                        ToggleView(showSliders: $showSliders)
                        // MARK: Sliders
                        if showSliders {
                            SliderView(value: $redValue, textColor: .red)
                            SliderView(value: $greenValue, textColor: .green)
                            SliderView(value: $blueValue, textColor: .blue)
                        }
                        // MARK: Stepper
                        Stepper(value: $likeCount, in: 0...100) {
                            Text("Likes: \(likeCount)")
                        }
                    }
                    
                    // Form Section 2
                    // MARK: Picker
                    Section {
                        PickerView(currentImageName: $currentImageName, imageNames: imageNames)
                    }
                }
                
                
                
                
                
                Spacer()
                
            }.navigationBarTitle("Thumbnail Creator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
