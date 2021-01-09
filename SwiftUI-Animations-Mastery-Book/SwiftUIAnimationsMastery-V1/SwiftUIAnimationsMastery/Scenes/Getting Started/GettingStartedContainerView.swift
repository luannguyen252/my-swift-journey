//
//  GettingStartedContainerView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/12/20.
// ✌️
//

import SwiftUI

struct GettingStartedContainerView {  }

// MARK: - View
extension GettingStartedContainerView: View {
    var body: some View {
        List {
            NavigationLink(destination: GettingStarted_NoAnimationExample()) {
                Text("Changing Properties Without Animation")
            }
            NavigationLink(destination: GettingStarted_WithAnimationExample()) {
                Text("Changing Properties With Animation")
            }
            NavigationLink(destination: GettingStarted_CurvesExample()) {
                Text("Animation Curves")
            }
            NavigationLink(destination: GettingStarted_Challenge1()) {
                Text("Challenge 1: Move the Circle")
            }
            NavigationLink(destination: GettingStarted_Challenge2()) {
                Text("Challenge 2: Move the Circle")
            }
        }
        .navigationBarTitle(Text("Getting Started"), displayMode: .large)
    }
}

// MARK: - Computeds
extension GettingStartedContainerView {
}

// MARK: - View Variables
extension GettingStartedContainerView {
}

// MARK: - Private Helpers
private extension GettingStartedContainerView {
}

// MARK: - Preview
struct GettingStartedContainerView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedContainerView()
    }
}
