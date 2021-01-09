//
//  AnimationTriggers_Exercise+PopupModalView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/27/20.
// ✌️
//

import SwiftUI

extension AnimationTriggers_Exercise {
    struct PopupModalView {
        let onClose: (() -> Void)?
    }
}

// MARK: - View
extension AnimationTriggers_Exercise.PopupModalView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                self.headerSection
                self.bodySection
                self.footerSection
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(geometry.size.width * 0.05)
            .shadow(
                color: Color(UIColor.darkGray),
                radius: geometry.size.width * 0.1, x: 0, y: 10
            )
        }
    }
}

// MARK: - Computeds
extension AnimationTriggers_Exercise.PopupModalView {
}

// MARK: - View Variables
extension AnimationTriggers_Exercise.PopupModalView {
    var headerSection: some View {
        HStack {
            Spacer()
            Text("Drag the popup off the screen")
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.accentColor)
    }

    var bodySection: some View {
        VStack {
            Spacer()
            Text("You can also tap outside of the popup to close.")
            Spacer()
        }
    }
    
    var footerSection: some View {
        Button(action: {
            self.onClose?()
        }) {
            HStack {
                Spacer()
                Text("Or Tap this Button to Close")
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Exercise.PopupModalView {
}

// MARK: - Preview
struct AnimationTriggers_Exercise_PopupModal_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                Text("Underlying View")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
            // .blur(radius: 22)

            AnimationTriggers_Exercise.PopupModalView(
                onClose: { }
            )
                .frame(width: 400, height: 320)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
