//
//  SwipableContentView.swift
//  SwipableContent
//
//  Created by Sudarshan Sharma on 11/25/20.
//

import SwiftUI

enum SwipeToDirection {
    case left, right, none
}

public struct SwipableContentView<Content: View>: View {
    // Main Content
    private let content: Content
    
    // Offset by which content will be shifted on swipe
    @State private var contentOffset: CGFloat = 0.0
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isFullSwipe = false
                switch swipeDirection(value) {
                case .left:
                    contentOffset = finalContentOffset + value.translation.width
                    
                    if shouldAllowFullSwipe && abs(contentOffset) > fullSwipeWidth {
                        isFullSwipe = true
                        if abs(contentOffset) >= fullSwipeWidth {
                            self.trailingContextualViewConfigurations?[0].action?()
                        }
                        if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations,  !trailingContextualViewConfigurations.isEmpty {
                            withAnimation(.easeIn) {
                                trailingContextualViewConfigurations[0].contentWidth = abs(value.translation.width)
                            }
                            
                            for index in 1..<trailingContextualViewConfigurations.count {
                                trailingContextualViewConfigurations[index].contentWidth = .zero
                            }
                        }
                    }
                    else {
                        if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                            withAnimation(.easeOut) {
                                for index in 0..<trailingContextualViewConfigurations.count {
                                    trailingContextualViewConfigurations[index].contentWidth = abs(value.translation.width) / CGFloat(trailingContextualViewConfigurations.count)
                                }
                            }
                        }
                    }
                    
                case .right:
                    if value.translation.width > 0 {
                        if contentOffset < 0 {
                            if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                                contentOffset += (value.translation.width / CGFloat(trailingContextualViewConfigurations.count))
                                for index in 0..<trailingContextualViewConfigurations.count {
                                    trailingContextualViewConfigurations[index].contentWidth = abs(contentOffset) / CGFloat(trailingContextualViewConfigurations.count)
                                }
                            }
                        }
                    }
                    
                case .none:
                    break
                    
                }
            }
            .onEnded { value in
                switch swipeDirection(value) {
                case .left:
                    finalContentOffset = contentOffset
                    if isFullSwipe {
                        withAnimation(.spring()) {
                            contentOffset = .zero
                            finalContentOffset = .zero
                            
                            if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                                for index in 0..<trailingContextualViewConfigurations.count {
                                    trailingContextualViewConfigurations[index].contentWidth = .zero
                                }
                            }
                        }
                    }
                    else if contentOffset < -(minimumSwipeDistance) {
                        withAnimation(.spring()) {
                            contentOffset = -totalContextualViewsWidth
                            if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                                for index in 0..<trailingContextualViewConfigurations.count {
                                    trailingContextualViewConfigurations[index].contentWidth = maxContextualViewWidth
                                }
                            }
                        }
                    }
                    else {
                        withAnimation(.spring()) {
                            contentOffset = .zero
                        }
                    }
                    
                case .right:
                    withAnimation(.spring()) {
                        contentOffset = .zero
                        finalContentOffset = .zero
                        
                        if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                            for index in 0..<trailingContextualViewConfigurations.count {
                                trailingContextualViewConfigurations[index].contentWidth = .zero
                            }
                        }
                    }
                    
                case .none:
                    break
                }
            }
    }
    
    // Offset by which content was shifted on previous swipe
    @State private var finalContentOffset: CGFloat = 0.0
    
    // Swipe width to perform full swipe action
    private var fullSwipeWidth: CGFloat = UIScreen.main.bounds.size.width * 0.8
    
    // Perform leading most or trailing most action on full swipe
    @State private var isFullSwipe = false
    
    // Configurations for leading contextual views
    @State private var leadingContextualViewConfigurations: [ContextualViewConfiguration]?
    
    // Width of single contextual view
    private var maxContextualViewWidth: CGFloat = 80.0
    
    // Minimum swipe distance to show contextual views
    private let minimumSwipeDistance: CGFloat
    
    // Should allow leading most or trailing most action on full swipe
    private var shouldAllowFullSwipe = true
    
    private var totalContextualViewsWidth: CGFloat {
        guard let trailingContextualViewConfigurations = trailingContextualViewConfigurations else {
            return 0
        }
        
        return CGFloat(trailingContextualViewConfigurations.count) * maxContextualViewWidth
    }
    
    // Configurations for trailing contextual views
    @State private var trailingContextualViewConfigurations: [ContextualViewConfiguration]?
    
    public init(minimumSwipeDistance: CGFloat = 20.0, @ViewBuilder _ content: () -> Content) {
        self.content = content()
        self.minimumSwipeDistance = minimumSwipeDistance
    }
    
    public var body: some View {
        ZStack(alignment: .trailing) {
            if trailingContextualViewConfigurations != nil {
                HStack(spacing: 0.0) {
                    Spacer()
                    ForEach((0..<trailingContextualViewConfigurations!.count).reversed(), id: \.self) { index in
                        ContextualView(configuration: trailingContextualViewConfigurations![index]) {
                            withAnimation(.spring()) {
                                contentOffset = 0.0
                                trailingContextualViewConfigurations![index].action?()
                                
                                if let trailingContextualViewConfigurations = self.trailingContextualViewConfigurations {
                                    for index in 0..<trailingContextualViewConfigurations.count {
                                        trailingContextualViewConfigurations[index].contentWidth = .zero
                                    }
                                }
                            }
                        }
                    }
                }
                .background(Color(UIColor.systemBackground))
            }
            
            content
                .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                .offset(x: contentOffset)
        }
        .onPreferenceChange(TrailingContextualViewPreferenceKey.self) { value in
            if trailingContextualViewConfigurations == nil {
                trailingContextualViewConfigurations = value
            }
        }
        .onPreferenceChange(LeadingContextualViewPreferenceKey.self) { value in
            if leadingContextualViewConfigurations == nil {
                leadingContextualViewConfigurations = value
            }
        }
        .if(trailingContextualViewConfigurations?.count ?? 0 > 0 ||
                leadingContextualViewConfigurations?.count ?? 0 > 0) {
            $0.gesture(dragGesture)
        }
    }
    
    func swipeDirection(_ value: DragGesture.Value) -> SwipeToDirection {
        if value.translation.width > 0 {
            return .right
        }
        else if value.translation.width < 0 {
            return .left
        }
        
        return .none
    }
}
