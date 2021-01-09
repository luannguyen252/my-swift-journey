//
//  BasicAnimations_Challenge1.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

struct BasicAnimations_Challenge1 {
    private var loginFormViewAnimationDuration: Double = 0.38

    private let titleText = "Challenge"
    private let subtitleText = "Show Login"
    
    @State private var isShowingLoginForm = false
    
}

// MARK: - View
extension BasicAnimations_Challenge1: View {
    var body: some View {
        VStack(spacing: 32) {
            descriptionSection
                
            Spacer()
            
            VStack(spacing: 32) {
                headerSection
            
                if isShowingLoginForm {
                    LoginFormView()
                        .transition(AnyTransition.slide)
                } else {
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding(.vertical)
    }
}

// MARK: - Computeds
extension BasicAnimations_Challenge1 {
}

// MARK: - View Variables
extension BasicAnimations_Challenge1 {
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
                Animation.easeInOut(duration: self.loginFormViewAnimationDuration)
            ) {
                self.isShowingLoginForm.toggle()
            }
        }) {
            Text("Login Now")
                .font(.headline)
        }
    }
}

// MARK: - Private Helpers
private extension BasicAnimations_Challenge1 {
}

// MARK: - Preview
struct BasicAnimations_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge1()
    }
}
