//
//  ShimmerConfig.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 03/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

public class ShimmerConfig: ObservableObject {
    
    public let willChange = PassthroughSubject<ShimmerConfig, Never>()
    
    var bgColor: Color
    var fgColor: Color
    var shimmerColor: Color
    var shimmerAngle: Double
    var shimmerDuration: Double

    private var timer: AnyCancellable?
    
    @Published internal var isActive: Bool = false
    
    public init(bgColor: Color = Color(white: 0.8),
                fgColor: Color = .white,
                shimmerColor: Color = Color(white: 1.0, opacity: 0.5),
                shimmerAngle: Double = 20,
                shimmerDuration: TimeInterval = 1,
                shimmerDelay: TimeInterval = 2) {
        self.bgColor = bgColor
        self.fgColor = fgColor
        self.shimmerColor = shimmerColor
        self.shimmerAngle = shimmerAngle
        self.shimmerDuration = shimmerDuration

        self.timer =  Timer
               .publish(every: shimmerDelay, on: RunLoop.main, in: RunLoop.Mode.default)
               .autoconnect()
               .sink(receiveValue: { [weak self] _ in
            guard let self = self else { return }
            self.isActive = false
            
            withAnimation { self.isActive = true }
        })
    }
    
    deinit {
        timer?.cancel()
        timer = nil
    }
    
}
