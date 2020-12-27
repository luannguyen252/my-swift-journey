//
//  ScrollingHStackModifier.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

// MARK: SNAP TO SCROLL
struct ScrollingHStackModifier: ViewModifier {
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
        // Calculate total content width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set initial offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }

    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    self.dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // Scroll to where user dragged
                    self.scrollOffset += event.translation.width
                    self.dragOffset = 0
                    
                    // Now calculate which item to snap to
                    let contentWidth: CGFloat = CGFloat(self.items) * self.itemWidth + CGFloat(self.items - 1) * self.itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = self.scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (self.itemWidth + self.itemSpacing)

                    // Should we stay at current index or are we closer to the next item
                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }

                    // Protect from scrolling out of bounds
                    index = min(index, CGFloat(self.items) - 1)
                    index = max(index, 0)

                    // Set final offset (snapping to item)
                    let newOffset = index * self.itemWidth + (index - 1) * self.itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - self.itemWidth) / 2.0) + self.itemSpacing
                    
                    // Animate snapping
                    withAnimation {
                        self.scrollOffset = newOffset
                    }
                })
            )
    }
}
