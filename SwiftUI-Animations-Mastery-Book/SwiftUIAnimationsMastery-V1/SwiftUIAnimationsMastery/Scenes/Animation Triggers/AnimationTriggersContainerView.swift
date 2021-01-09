//
//  AnimationTriggersContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/12/20.
// ✌️
//

import SwiftUI

struct AnimationTriggersContainerView {  }

// MARK: - View
extension AnimationTriggersContainerView: View {
    var body: some View {
        List {
            Section(header: Text("Examples")) {
                Group {
                    NavigationLink(destination: AnimationTriggers_Buttons()) {
                        Text("AnimationTriggers: Buttons")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_SegmentedControls()) {
                        Text("AnimationTriggers: Segmented Controls")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_Sliders()) {
                        Text("AnimationTriggers: Sliders")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_Steppers()) {
                        Text("AnimationTriggers: Steppers")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_Toggles()) {
                        Text("AnimationTriggers: Toggles")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_DragGestures()) {
                        Text("AnimationTriggers: Drag Gestures")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_LongPressGestures()) {
                        Text("AnimationTriggers: Long-Press Gestures")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_TapGestures()) {
                        Text("AnimationTriggers: Tap Gestures")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_MagnificationGestures()) {
                        Text("AnimationTriggers: Magnification Gestures")
                    }
                    
                    NavigationLink(destination: AnimationTriggers_RotationGestures()) {
                        Text("AnimationTriggers: Rotation Gestures")
                    }
                }
                
                Group {
                    NavigationLink(destination: AnimationTriggers_ScrollLocation()) {
                        Text("AnimationTriggers: Scroll Location")
                    }
                }
            }
            
            Section(header: Text("Exercise")) {
                NavigationLink(
                    destination: AnimationTriggers_Exercise()
                        .accentColor(.pink)
                ) {
                    Text("Animation Triggers: Exercise 💪")
                }
            }
            
            Section(header: Text("Challenge")) {
                NavigationLink(destination: AnimationTriggers_Challenge()) {
                    Text("Animation Triggers: Challenge 🏆")
                }
            }
        }
        .navigationBarTitle(Text("Animation Triggers"), displayMode: .large)
    }
}

// MARK: - Computeds
extension AnimationTriggersContainerView {  }

// MARK: - View Variables
extension AnimationTriggersContainerView {  }

// MARK: - Private Helpers
private extension AnimationTriggersContainerView {  }

// MARK: - Preview
struct AnimationTriggersContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTriggersContainerView()
    }
}
