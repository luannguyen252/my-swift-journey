//
//  ColorConstants.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ColorConstants {
    static let topBackground = Color.init(red: 38/255, green: 42/255, blue: 48/255)
    static let bottomBackground = Color.init(red: 30/255, green: 34/255, blue: 38/255)
    static let backgroundLinear = LinearGradient(
        gradient: Gradient(colors: [topBackground, bottomBackground]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let hexagonTop = Color.init(red: 33/255, green: 35/255, blue: 42/255)
    static let hexagonBottom = Color.init(red: 86/255, green: 89/255, blue: 97/255)
    static let hexagonLinear = LinearGradient(
        gradient: Gradient(colors: [hexagonTop, hexagonBottom]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let hexagonLinearInverted = LinearGradient(
        gradient: Gradient(colors: [hexagonBottom, hexagonTop]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let circle = Color.init(red: 81/255, green: 85/255, blue: 93/255)
    static let smallCircle = Color.init(red: 195/255, green: 200/255, blue: 209/255)
    static let textCirclePrimary = Color.init(red: 242/255, green: 243/255, blue: 247/255)
    static let textCircleSecendary = Color.init(red: 155/255, green: 160/255, blue: 168/255)
    static let circleLinear = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.black]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let selectedColor = Color.init(red: 246/255, green: 97/255, blue: 107/255)
    static let unselectedBackground = Color.init(red: 109/255, green: 114/255, blue: 122/255)
    static let unselectedforeground = Color.init(red: 154/255, green: 159/255, blue: 167/255)

    static let graphUnselected = Color.init(red: 73/255, green: 75/255, blue: 82/255)
    
    static let buttonBackground = Color.init(red: 45/255, green: 49/255, blue: 55/255)
    
    static let heartRateBackground = Color.init(red: 30/255, green: 34/255, blue: 37/255)
    
    static let heartLimitTop = Color.init(red: 33/255, green: 35/255, blue: 41/255)
    static let heartLimitBottom = Color.init(red: 49/255, green: 51/255, blue: 57/255)
    static let heartLimitRadial = RadialGradient(gradient: Gradient(colors: [heartLimitBottom, heartLimitTop]), center: .bottomTrailing, startRadius: 5, endRadius: 800)
    
    static let blackClearLinear = LinearGradient(
        gradient: Gradient(colors: [topBackground, bottomBackground]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let whiteClearLinear = LinearGradient(
        gradient: Gradient(colors: [Color.clear, Color.white]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let whiteClearWithStopLinear = LinearGradient(
        gradient: Gradient(stops: [.init(color: Color.clear, location: 0.0), .init(color: Color.white, location: 0.9)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let whiteClearWithStopTopMiddleToBottomMiddleLinear = LinearGradient(
        gradient: Gradient(stops: [.init(color: Color.clear, location: 0.0), .init(color: Color.white.opacity(0.3), location: 0.9)]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let whiteToDarkGrayLinear = LinearGradient(
        gradient: Gradient(colors: [Color(white: 0.6), topBackground]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    static let toggleUnselected = Color.init(red: 64/255, green: 66/255, blue: 73/255)
}
