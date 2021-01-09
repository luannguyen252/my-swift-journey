//
//  AnimationScope_ParentAndChildren.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/21/20.
// ✌️
//

import SwiftUI

struct AnimationScope_ParentAndChildren {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Scope"
    private let subtitleText = "Parent & Children"
    private let descriptionText1 = "The animation modifier can go on a parent view to animate all children within."
    
    private let animationDuration: TimeInterval = 0.34
    
    @State private var animationFlag = false
}

// MARK: - View
extension AnimationScope_ParentAndChildren: View {
    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
                
            tileSection
                .animation(.linear)
            
            AnimationToggleButton {
                self.animationFlag.toggle()
            }
            .padding(.vertical)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationScope_ParentAndChildren {  }

// MARK: - View Variables
extension AnimationScope_ParentAndChildren {
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
        HStack {
            Rectangle()
                .fill(Color.red)
                .hueRotation(animationFlag ? .radians(.pi) : .zero)
            
            Rectangle()
                .fill(Color.green)
                .hueRotation(animationFlag ? .radians(.pi) : .zero)
            
            Rectangle()
                .fill(Color.blue)
                .hueRotation(animationFlag ? .radians(.pi) : .zero)
        }
    }
}

// MARK: - Private Helpers
private extension AnimationScope_ParentAndChildren {  }

// MARK: - Preview
struct AnimationScope_ParentAndChildren_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationScope_ParentAndChildren()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // .colorScheme(.dark)
    }
}
