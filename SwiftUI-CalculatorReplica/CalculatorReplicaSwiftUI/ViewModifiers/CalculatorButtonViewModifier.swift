//
//  CalculatorButtonViewModifier.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButtonViewModifier: ViewModifier {
    let button: CalculatorOptionProtocol
    
    var buttonSize: (width: CGFloat, height: CGFloat) {
        let numberOfButtonsPerRow = Constant.numberOfButtonsPerRow
        let screenWidth = UIScreen.main.bounds.width
        let offset = button.gridSpace - 1
        
        let height = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * Constant.spacing)) / CGFloat(numberOfButtonsPerRow)
        let width = height * CGFloat(button.gridSpace) + CGFloat(Constant.spacing * offset)
        
        return (width, height)
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: self.buttonSize.width, height: self.buttonSize.height)
            .foregroundColor(button.foregroundColor)
            .background(button.backgroundColor)
            .cornerRadius(self.buttonSize.width / 2)
    }
}

// MARK: - Constants

extension CalculatorButtonViewModifier {
    struct Constant {
        static let spacing = 12
        static let numberOfButtonsPerRow = 4
    }
}
