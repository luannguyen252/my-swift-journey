//
//  Education-MorseCode.swift
//  Escape Room Project
//
//  Created by Julian Schiavo on 17/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

public extension MorseCodeClue {
    func educationalContent() -> EducationalContent<AnyView> {
        EducationalContent(imageName: "01.square", title: "Binary") {
            AnyView(MorseCodeEducationalContent())
        }
    }
}

public struct MorseCodeEducationalContent: View {
    
    @State private var currentIndex = 0
    private let decimalToBinary = [0: [0, 0, 0, 0],
                                   1: [0, 0, 0, 1],
                                   2: [0, 0, 1, 0],
                                   3: [0, 0, 1, 1],
                                   4: [0, 1, 0, 0],
                                   5: [0, 1, 0, 1],
                                   6: [0, 1, 1, 0],
                                   7: [0, 1, 1, 1],
                                   8: [1, 0, 0, 0],
                                   9: [1, 0, 0, 1],
                                   10: [1, 0, 1, 0],
                                   11: [1, 0, 1, 1],
                                   12: [1, 1, 0, 0],
                                   13: [1, 1, 0, 1],
                                   14: [1, 1, 1, 0],
                                   15: [1, 1, 1, 1]]
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let itemFont = Font.system(size: 80, weight: .light)
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("To solve this puzzle, you had to listen or look for morse code and use a key to figure out what letters the code matched to.")
            Text("Binary is a number system similar to the base 10 number system that we use in everyday life. It represents all values as either 0, off, or 1, on. Morse code can be considered binary as it uses short and long codes, which can be represented as 0 and 1.")
            
            Spacer().frame(height: 10)
            binaryRepresentation
            Spacer().frame(height: 10)
            
            Text("The above shows how decimal numbers can be represented in binary form, with each binary place value translating to a decimal value. Using these 4 places, decimal numbers up to 15 can be shown.")
            
            Text("Binary is important because at the lowest level, computers only understand binary. This is caused by electrical wires storing information as either being powered or not. However, sets of binary numbers can be used to store any information, such as text, images, or audio, so we do not actually see binary when using computers.")
            
            Spacer().frame(height: 20)
        }.frame(maxHeight: .infinity)
    }
    
    private var binaryRepresentation: some View {
        let binary = decimalToBinary[currentIndex, default: [0, 0, 0, 0]]
        return HStack {
            Spacer()
            Image(systemName: "\(currentIndex).circle").id(currentIndex)
            Spacer().frame(maxWidth: 30)
            Image(systemName: "\(binary[0]).square").transition(.opacity)
            Image(systemName: "\(binary[1]).square").transition(.opacity)
            Image(systemName: "\(binary[2]).square").transition(.opacity)
            Image(systemName: "\(binary[3]).square").transition(.opacity)
            Spacer()
        }
        .font(itemFont)
        .onReceive(timer) { _ in
            if self.currentIndex == 15 {
                self.currentIndex = 0
            } else {
                self.currentIndex += 1
            }
        }
    }
}
