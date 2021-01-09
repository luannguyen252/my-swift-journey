//
//  BasicAnimations_Challenge2+MenuView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI

extension BasicAnimations_Challenge2 {
    struct MenuView {
    }
}

// MARK: - View
extension BasicAnimations_Challenge2.MenuView: View {
    var body: some View {
        // GeometryReader { geometry in
            VStack {
                Image(systemName: "line.horizontal.3")
                Spacer()
            }
            .padding()
        // }
    }
}

// MARK: - Computeds
extension BasicAnimations_Challenge2.MenuView {
}

// MARK: - View Variables
extension BasicAnimations_Challenge2.MenuView {
}

// MARK: - Private Helpers
private extension BasicAnimations_Challenge2.MenuView {
}

// MARK: - Preview
struct BasicAnimations_Challenge2_MenuView_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge2.MenuView()
            .frame(width: 300, height: 400)
            .background(Color.purple)
            .cornerRadius(12)
    }
}
