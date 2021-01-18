//
//  StarRatingView.swift
//  
//
//  Created by Enes Karaosman on 9.04.2020.
//

import SwiftUI

public struct StarRatingView: View {
    
    public struct Style {
        
        public let fillColor: Color
        public let lineWidth: CGFloat
        public let borderColor: Color
        public let starExtrusion: CGFloat
        
        public init(
            fillColor: Color = .starYellow,
            borderColor: Color = .starYellow,
            borderWidth: CGFloat = 4,
            starExtrusion: CGFloat = 20) {
            self.fillColor = fillColor
            self.borderColor = borderColor
            self.lineWidth = borderWidth
            self.starExtrusion = starExtrusion
        }
        
    }
    
    private let starCount: Int
    private let totalPercentage: CGFloat
    private let style: Style

    private var percantageList: [CGFloat] = []
    
    public init(starCount: Int = 5, totalPercentage: CGFloat, style: Style = .init()) {
        self.starCount = starCount
        self.totalPercentage = totalPercentage
        self.style = style
        self.percantageList = self.calculatePercantageList(
            starCount: starCount,
            totalPercentage: totalPercentage
        )
    }
    
    private func calculatePercantageList(starCount: Int, totalPercentage: CGFloat) -> [CGFloat] {
        
        var result: [CGFloat] = []
        
        let total = totalPercentage * CGFloat(starCount)
        
        let fullStarCount = Int(total / 100)
        for _ in 0..<fullStarCount {
            result.append(100)
        }
        
        if result.count == starCount { return result }
        
        let remaining = total.truncatingRemainder(dividingBy: 100)
        result.append(remaining)
        
        while result.count != starCount {
            result.append(0)
        }
        
        return result
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<starCount) { idx in
                StarView(
                    percentage: self.percantageList[idx],
                    style: StarView.Style(
                        fillColor: self.style.fillColor,
                        borderColor: self.style.borderColor,
                        borderWidth: self.style.lineWidth,
                        starExtrusion: self.style.starExtrusion
                    )
                )
            }
        }
    }
    
}
