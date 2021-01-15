//
//  SubviewData.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/16.
//


import SwiftUI


enum Subviews: String, CaseIterable {
    case plusSecond
    case darkMode
    case colorMixer
    case typefaceComparison
    case textFieldAnimation
    case indexCardView
    case breathingAnimation
    case bedtimeSchedule
    case symbolsPreviewer
    case sideMenuAction
    case lottieAnimation
    case appStoreCard
}

extension Subviews {
    
    
    var view: AnyView {
        switch self {
        case .plusSecond:
            return transform(PlusSecond())
        case .darkMode:
            return transform(DarkMode())
        case .colorMixer:
            return transform(ColorMixer(colorR: randomDouble, colorG: randomDouble, colorB: randomDouble))
        case .typefaceComparison:
            return transform(TypefaceComparison())
        case .textFieldAnimation:
            return transform(TextFieldAnimation())
        case .indexCardView:
            return transform(IndexCardView())
        case .breathingAnimation:
            return transform(BreathingAnimation())
        case .bedtimeSchedule:
            return transform(BedtimeSchedule())
        case .symbolsPreviewer:
            return transform(SFSymbolsPreviewer())
        case .sideMenuAction:
            return transform(SideMenuAction())
        case .lottieAnimation:
            return transform(LottieDisplayView())
        case .appStoreCard:
            return transform(AppStoreCard())
        }
    }
    
    private func transform<V: View>(_ view: V) -> AnyView {
        AnyView(view.navigationTitle(self.rawValue))
    }
    
    private var randomDouble: Double {
        return Double.random(in: 0 ..< 1)
    }
}
