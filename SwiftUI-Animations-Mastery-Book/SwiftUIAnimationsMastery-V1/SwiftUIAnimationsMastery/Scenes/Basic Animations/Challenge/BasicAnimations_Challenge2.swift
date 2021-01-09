//
//  BasicAnimations_Challenge2.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_Challenge2 {
    private var animationDuration: Double = 0.38

    private let titleText = "Challenge"
    private let subtitleText = "Show a Menu"
    
    @State private var isShowingMenu = false
    
}

// MARK: - View
extension BasicAnimations_Challenge2: View {
    var body: some View {
        VStack(spacing: 32) {
            descriptionSection
               
            GeometryReader { geometry in
                VStack {
                    self.animationToggleButton
                
                    Spacer()
                    
                    if self.isShowingMenu {
                        MenuView()
                            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.5)
                            .transition(self.menuViewTransition)
                            .background(Color.purple)
                            .cornerRadius(
                                min(geometry.size.width, geometry.size.height) * 0.035
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

// MARK: - Computeds
extension BasicAnimations_Challenge2 {
    var menuViewTransition: AnyTransition {
        AnyTransition
            .move(edge: .bottom)
            .combined(with: .scale(scale: 0, anchor: .bottom))
            .combined(with: .opacity)
    }
}

// MARK: - View Variables
extension BasicAnimations_Challenge2 {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("Already have an account?")
                .font(.title)
            
            animationToggleButton
        }
    }
    
    private var animationToggleButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeInOut(duration: self.animationDuration)
            ) {
                self.isShowingMenu.toggle()
            }
        }) {
            Text("\(isShowingMenu ? "Close" : "Open") ze Menu!")
                .font(.headline)
        }
    }
}

// MARK: - Private Helpers
private extension BasicAnimations_Challenge2 {
}

// MARK: - Preview
struct BasicAnimations_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge2()
    }
}
