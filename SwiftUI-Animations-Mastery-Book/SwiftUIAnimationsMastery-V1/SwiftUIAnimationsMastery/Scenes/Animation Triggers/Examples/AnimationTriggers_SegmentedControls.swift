//
//  AnimationTriggers_SegmentedControls.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/12/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_SegmentedControls {
    private var animationDuration: Double = 0.38

    private let titleText = "Animation Triggers"
    private let subtitleText = "Segmented Controls"
    private let descriptionText = "A segmented control (picker) can also trigger animations, such as sliding views into and out of place."
    
    @State private var displayMode: DisplayMode = .day
}

// MARK: - View
extension AnimationTriggers_SegmentedControls: View {
    var body: some View {
        VStack(spacing: 22) {
            descriptionSection
                .layoutPriority(2)
            
            VStack(spacing: 12) {
                imageControls
            
                imageCards
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("")
    }
}

// MARK: - Computeds
extension AnimationTriggers_SegmentedControls {
    var imageCardSlideAnimation: Animation {
        Animation.easeInOut(duration: animationDuration)
    }
}

// MARK: - View Variables
extension AnimationTriggers_SegmentedControls {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: descriptionText, textColor: .white, backgroundColor: .green)
        }
    }
    
    private var imageControls: some View {
        Picker(selection: $displayMode, label: Text("Currently Displayed Image")) {
            ForEach(DisplayMode.allCases) { displayMode in
                Text(displayMode.displayText).tag(displayMode)
            }
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }

    private var imageCards: some View {
        GeometryReader { geometry in
            ZStack {
                ImageCardView(
                    titleText: DisplayMode.day.displayText,
                    titleImage: Image(systemName: "sun.max.fill"),
                    imageName: DisplayMode.day.imageName
                )
                .foregroundColor(.white)
                .frame(width: geometry.size.width)
                .cornerRadius(12)
                .offset(
                    x: self.displayMode == .day ? 0 : -UIScreen.main.bounds.width,
                    y: 0
                )
                .animation(self.imageCardSlideAnimation)
                
                ImageCardView(
                    titleText: DisplayMode.night.displayText,
                    titleImage: Image(systemName: "moon.fill"),
                    imageName: DisplayMode.night.imageName
                )
                .foregroundColor(.orange)
                .frame(width: geometry.size.width)
                .cornerRadius(12)
                .offset(
                    x: self.displayMode == .night ? 0 : -UIScreen.main.bounds.width,
                    y: 0
                )
                .animation(self.imageCardSlideAnimation)
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_SegmentedControls {
}

// MARK: - ImageCardView
extension AnimationTriggers_SegmentedControls {
    struct ImageCardView {
        var titleText: String
        var titleImage: Image
        var imageName: String
    }
}

extension AnimationTriggers_SegmentedControls.ImageCardView: View {
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
            
            VStack {
                titleImage
                    .font(.system(size: 50))
                
                Text(titleText)
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Display Mode
extension AnimationTriggers_SegmentedControls {
    enum DisplayMode: String {
        case day
        case night
    }
}

extension AnimationTriggers_SegmentedControls.DisplayMode: CaseIterable {  }

extension AnimationTriggers_SegmentedControls.DisplayMode: Identifiable {
    var id: String { rawValue }
}

extension AnimationTriggers_SegmentedControls.DisplayMode {
    var displayText: String {
        switch self {
        case .day:
            return "Day ☀️"
        case .night:
            return "Night 🌗"
        }
    }
    
    var imageName: String {
        switch self {
        case .day:
            return "day"
        case .night:
            return "night"
        }
    }
}

// MARK: - Preview
struct AnimationTriggers_SegmentedControls_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_SegmentedControls()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
