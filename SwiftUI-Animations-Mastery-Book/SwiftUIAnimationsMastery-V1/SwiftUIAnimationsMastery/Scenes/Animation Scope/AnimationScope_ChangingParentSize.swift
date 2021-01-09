//
//  AnimationScope_ChangingParentSize.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/23/20.
// ✌️
//

import SwiftUI

struct AnimationScope_ChangingParentSize {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Scope"
    private let subtitleText = "Changing Size in Parent"
    private let descriptionText1 = "Put the animation modifier on the parent so all views animate when one changes."
    
    private let animationDuration: TimeInterval = 0.34
    private let eyeColor = Color.pink
    
    @State private var isEyeOpen = false
}

// MARK: - View
extension AnimationScope_ChangingParentSize: View {
    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
                
            tileSection
                .animation(sizeChangeAnimation)
                .padding(.vertical)
            
            AnimationToggleButton {
                self.isEyeOpen.toggle()
            }
            .padding(.vertical)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationScope_ChangingParentSize {
    var sizeChangeAnimation: Animation {
        .easeOut(duration: animationDuration)
    }
    
    var eyelashColor: Color {
        switch colorScheme {
        case .dark:
            return isEyeOpen ? .white : eyeColor
        case .light:
            return isEyeOpen ? .black : eyeColor
        @unknown default:
            return isEyeOpen ? .gray : eyeColor
        }
    }
    
    var blockColor: Color {
        switch colorScheme {
        case .dark:
            return isEyeOpen ? eyeColor : .white
        case .light:
            return isEyeOpen ? eyeColor : .black
        @unknown default:
            return isEyeOpen ? eyeColor : .gray
        }
    }
}

// MARK: - View Variables
extension AnimationScope_ChangingParentSize {
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
    
    private var tileSection: some View {
        GeometryReader { geometry in
            VStack(spacing: 4) {
                self.eyeGroup
                    .frame(height: self.isEyeOpen ? geometry.size.height * 0.80 : geometry.size.height * 0.5)
                
                self.bottomBlock
            }
        }
    }
    
    private var eyeGroup: some View {
        GeometryReader { geometry in
            HStack {
                self.blockColor
                    .frame(height: self.isEyeOpen ? self.eyeHeight(in: geometry) * 0.1 : geometry.size.height)
                
                VStack(spacing: 1) {
                    self.eyelashColor
                        .frame(
                            height: self.isEyeOpen ?
                                (geometry.size.height - self.eyeHeight(in: geometry)) / 2.5
                                : geometry.size.height / 2
                        )
                    
                    Image(systemName: "eye.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(self.eyeColor)
                        .frame(height: self.eyeHeight(in: geometry))
                    
                    self.eyelashColor
                        .frame(
                            height: self.isEyeOpen ?
                                (geometry.size.height - self.eyeHeight(in: geometry)) / 2.5
                                : geometry.size.height / 2
                        )
                }
                
                self.blockColor
                    .frame(height: self.isEyeOpen ? self.eyeHeight(in: geometry) * 0.1 : geometry.size.height)
            }
        }
    }
    
    private var bottomBlock: some View {
        Rectangle()
            .fill(blockColor)
    }
}

// MARK: - Private Helpers
private extension AnimationScope_ChangingParentSize {
    func eyeHeight(in geometry: GeometryProxy) -> CGFloat {
        geometry.size.height * (isEyeOpen ? 0.35 : 0.0)
    }
}

// MARK: - Preview
struct AnimationScope_ChangingParentSize_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationScope_ChangingParentSize()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // .colorScheme(.dark)
    }
}
