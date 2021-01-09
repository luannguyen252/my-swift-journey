//
//  BasicAnimationsContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/12/20.
// ✌️
//

import SwiftUI

struct BasicAnimationsContainerView {  }

// MARK: - View
extension BasicAnimationsContainerView: View {
    var body: some View {
        List {
            // 🔑 Use `Section` to get around SwiftUI's 10-view-per-level limit.
            Section {
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Color()) {
                    Text("Animatable Properties: Color")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_HueRotation()) {
                    Text("Animatable Properties: Hue Rotation")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Offset()) {
                    Text("Animatable Properties: Offset")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Alignment()) {
                    Text("Animatable Properties: Alignment")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_GeoemetryReaderPosition()) {
                    Text("Animatable Properties: GeoemetryReader Position")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Opacity()) {
                    Text("Animatable Properties: Opacity")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_RotationEffect()) {
                    Text("Animatable Properties: Rotation Effect")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_RotationEffectAnchors()) {
                    Text("Animatable Properties: Rotation Around Anchors")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Frame()) {
                    Text("Animatable Properties: Frame")
                }
                NavigationLink(destination: BasicAnimations_AnimatableProperties_ScaleEffect()) {
                    Text("Animatable Properties: Scale Effect")
                }
            }
            
            Section {
                NavigationLink(destination: BasicAnimations_AnimatableProperties_Trim()) {
                    Text("Animatable Properties: Trim")
                }
                
                NavigationLink(destination: BasicAnimations_AnimatablePropertiesExercise()) {
                    Text("Animatable Properties Exercise 💪")
                }
            }
            
            Section {
                NavigationLink(destination: BasicAnimations_CheckUnderstanding1()) {
                    Text("Check Understanding 1")
                }
                NavigationLink(destination: BasicAnimations_CheckUnderstanding2()) {
                    Text("Check Understanding 2")
                }
            }
            
            Section {
                NavigationLink(destination: BasicAnimations_Challenge1()) {
                    Text("Challenge: Show Login")
                }
                NavigationLink(destination: BasicAnimations_Challenge2()) {
                    Text("Challenge: Show A Menu")
                }
            }
        }
       .navigationBarTitle(Text("Basic Animations"), displayMode: .large)
    }
}

// MARK: - Computeds
extension BasicAnimationsContainerView {
}

// MARK: - View Variables
extension BasicAnimationsContainerView {
}

// MARK: - Private Helpers
private extension BasicAnimationsContainerView {
}

// MARK: - Preview
struct BasicAnimationsContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimationsContainerView()
    }
}
