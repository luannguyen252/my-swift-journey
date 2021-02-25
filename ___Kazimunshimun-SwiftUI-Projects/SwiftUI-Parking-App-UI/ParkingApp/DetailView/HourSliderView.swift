//
//  HourSliderView.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI

struct HourSliderView: View {
    @Binding var progress: CGFloat
    @Binding var showHourSlider: Bool
    @State var knobPosition: CGFloat = 0.0
    let sliderConfig = HourSliderConfig()
    let width: CGFloat
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0.0)
            .onChanged { value in
                // calculate progress width
                calculateProgressWidth(xLocation: value.location.x)
            }
            .onEnded { value in
                // calculate step
                calculateStep(xLocation: value.location.x)
                showHourSlider = false
            }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                ForEach(Array(stride(from: 0, to: 12, by: 1)), id: \.self) { i in
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 2, height: i%2 == 0 ? 9 : 5)
                    if i != 11 {
                        Spacer()
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.black)
                .frame(width: knobPosition, height: 9)
            
            Circle()
                .fill(Color.black)
                .frame(width: 26, height: 26)
                .padding(12)
                .offset(x: -22)
                .offset(x: knobPosition)
                .gesture(dragGesture)
        }
    }
    
    func calculateInitialKnobPosition() {
        progress = sliderConfig.minimumValue
        knobPosition = (progress * width) - knobPosition
    }
    
    func calculateProgressWidth(xLocation: CGFloat) {
        let tempProgress = xLocation/width
        if tempProgress >= 0 && tempProgress <= 1 {
            let roundedProgress = (tempProgress * (sliderConfig.maximumValue - sliderConfig.minimumValue)) + sliderConfig.minimumValue
            progress = roundedProgress.rounded()
            
            let tempPosition = (tempProgress * width) - sliderConfig.knobRadius
            knobPosition = tempPosition > 0 ? tempPosition : 0
        }
        
    }
    
    func calculateStep(xLocation: CGFloat) {
        let tempProgress = xLocation/width
        if tempProgress >= 0 && tempProgress <= 1 {
            let roundedProgress = (tempProgress * (sliderConfig.maximumValue - sliderConfig.minimumValue)) + sliderConfig.minimumValue
            progress = roundedProgress.rounded()
            
            let updatedTempProgress = (roundedProgress - sliderConfig.minimumValue) / (sliderConfig.maximumValue - sliderConfig.minimumValue)
            knobPosition = updatedTempProgress == 0 ? 0 : (updatedTempProgress * width) - sliderConfig.knobRadius
        }
    }
}

struct HourSliderConfig {
    let minimumValue: CGFloat = 0.0
    let maximumValue: CGFloat = 12.0
    let knobRadius: CGFloat = 22.0
}
