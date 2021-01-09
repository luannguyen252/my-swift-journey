//
//  AnimationOptions_DurationParameter.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/2/20.
// ✌️
//

import SwiftUI

struct AnimationOptions_DurationParameter {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Options"
    private let subtitleText = "Duration Parameter"
    private let descriptionText1 = "To set a duration, you need to turn the animation type into a function. Like .easeInOut into .easeInOut(duration: 1)."
    private let descriptionText2 = "Note: The default animation duration in SwiftUI is less than a second. Somewhere around 0.4 seconds."
    
    @State private var isAnimated = false
}

// MARK: - View
extension AnimationOptions_DurationParameter: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                self.descriptionSection
                    .layoutPriority(2)
                
                Group {
                    self.noParameterSection
                    self.durationParameterSection
                }
                .padding(.horizontal)
                
                Spacer()
                
                self.animationToggleButton
                    .padding(.vertical)
                
                BannerTextView(text: self.descriptionText2, textColor: .white, backgroundColor: .purple)
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationOptions_DurationParameter {  }

// MARK: - View Variables
extension AnimationOptions_DurationParameter {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText1,
                textColor: .white,
                backgroundColor: .purple,
                font: horizontalSizeClass == .regular ? .largeTitle : .title
            )
        }
    }

    private var animationToggleButton: some View {
        Button(action: {
            self.isAnimated.toggle()
        }) {
            Text("Animate ⚡️")
                .font(.title)
        }
    }

    private var noParameterSection: some View {
        GeometryReader { geometry in
            VStack {
                Text("Duration: Default")
                    .font(.title)
                
                HStack {
                    Image(systemName: "hare.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.pink)
                        .frame(width: 80, height: 80)
                        .offset(x: self.isAnimated ? geometry.size.width - 80 : 0, y: 0)
                        .animation(.easeOut)
                    Spacer()
                }
            }
        }
    }
    
    private var durationParameterSection: some View {
        GeometryReader { geometry in
            VStack {
                Text("Duration: 2 Seconds")
                    .font(.title)
                
                HStack {
                    Image(systemName: "tortoise.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.green)
                        .frame(width: 80, height: 80)
                        .offset(x: self.isAnimated ? geometry.size.width - 80 : 0, y: 0)
                        .animation(.easeOut(duration: 2.0))
                    
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationOptions_DurationParameter {  }

// MARK: - Preview
struct AnimationOptions_DurationParameter_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationOptions_DurationParameter()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
