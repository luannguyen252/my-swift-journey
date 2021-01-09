//
//  RootView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/3/20.
// ✌️
//

import SwiftUI

struct RootView {  }

// MARK: - View
extension RootView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GettingStartedContainerView()) {
                    Text("Getting Started")
                }
                
                NavigationLink(destination: BasicAnimationsContainerView()) {
                    Text("Basic Animations")
                }
                
                NavigationLink(destination: AnimationTriggersContainerView()) {
                    Text("Animation Triggers")
                }
                
                NavigationLink(destination: AnimationOptionsContainerView()) {
                    Text("Animation Options")
                }
                
                NavigationLink(destination: AnimationScopeContainerView()) {
                    Text("Animation Scope")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle(Text("SwiftUI Animations Mastery"), displayMode: .large)
        }
    }
}

// MARK: - Computeds
extension RootView {  }

// MARK: - View Variables
extension RootView {  }

// MARK: - Private Helpers
private extension RootView {  }

// MARK: - Preview
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
