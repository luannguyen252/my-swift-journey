//
//  ScrollViewWithRefresh.swift
//  ScrollViewWithRefresh
//
//  Created by Alien Lee on 2020/11/20.
//

import SwiftUI

struct ScrollViewWithRefresh<Content: View>: View {
    @State private var preOffset: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var frozen = false
    @State private var rotation: Angle = .degrees(0)
    
    var thresholdHeight: CGFloat = 120
    
    @Binding var refreshing: Bool
    let onScroll: (CGRect, CGPoint) -> Void
    let content: Content
    
    
    init(_ thresholdHeight: CGFloat = 120, refreshing: Binding<Bool>, onScroll: @escaping (CGRect, CGPoint) -> Void = {_,_  in }, @ViewBuilder content: () -> Content) {
        self.thresholdHeight = thresholdHeight
        self._refreshing = refreshing
        self.onScroll = onScroll
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .top) {
                    MovingPositionView()
                    
                    VStack {
                        self.content
                            .alignmentGuide(.top, computeValue: { _ in
                                (self.refreshing && self.frozen) ? -self.thresholdHeight * 0.5 : 0
                            })
                           
                    }
                    
                    RefreshHeader(height: self.thresholdHeight * 0.5, loading: self.refreshing, frozen: self.frozen, rotation: self.rotation)
        
                }
            }
            .background(FixedPositionView())
            .onPreferenceChange(MCRefreshablePreferenceTypes.MCRefreshablePreferenceKey.self) { values in
                self.calculate(values)
            }
            .onChange(of: refreshing) { refreshing in
                DispatchQueue.main.async {
                    if refreshing {
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
                }
            }
        }
    }
    
    func calculate(_ values: [MCRefreshablePreferenceTypes.MCRefreshablePreferenceData]) {
        DispatchQueue.main.async {

            let movingBounds = values.first(where: { $0.viewType == .movingPositionView })?.bounds ?? .zero
            let fixedBounds = values.first(where: { $0.viewType == .fixedPositionView })?.bounds ?? .zero
            
            self.offset = movingBounds.minY - fixedBounds.minY
            
            self.onScroll(fixedBounds, CGPoint(x: movingBounds.minX - fixedBounds.minX, y: movingBounds.minY - fixedBounds.minY))
            
            self.rotation = self.headerRotation(self.offset)

            if !self.refreshing, self.offset > self.thresholdHeight, self.preOffset <= self.thresholdHeight {
                self.refreshing = true
            }
            
            if self.refreshing {
                if self.preOffset > self.thresholdHeight, self.offset <= self.thresholdHeight {
                    self.frozen = true
                }
            } else {
                self.frozen = false
            }
            
            self.preOffset = self.offset
        }
    }
    
    func headerRotation(_ scrollOffset: CGFloat) -> Angle {
        if scrollOffset < self.thresholdHeight * 0.60 {
            return .degrees(0)
        } else {
            let h = Double(self.thresholdHeight)
            let d = Double(scrollOffset)
            let v = max(min(d - (h * 0.6), h * 0.4), 0)
            return .degrees(180 * v / (h * 0.4))
        }
    }

    struct FixedPositionView: View {
        var body: some View {
            GeometryReader { proxy in
                Color
                    .clear
                    .preference(key: MCRefreshablePreferenceTypes.MCRefreshablePreferenceKey.self, value: [MCRefreshablePreferenceTypes.MCRefreshablePreferenceData(viewType: .fixedPositionView, bounds: proxy.frame(in: .global))])
            }
        }
    }
    
    struct MovingPositionView: View {
        var body: some View {
            GeometryReader { proxy in
                Color
                    .clear
                    .preference(key: MCRefreshablePreferenceTypes.MCRefreshablePreferenceKey.self, value: [MCRefreshablePreferenceTypes.MCRefreshablePreferenceData(viewType: .movingPositionView, bounds: proxy.frame(in: .global))])
            }
            .frame(height: 0)
        }
    }
    
    struct RefreshHeader: View {
        var height: CGFloat
        var loading: Bool
        var frozen: Bool
        var rotation: Angle
        
        var body: some View {
            HStack(spacing: 20) {
                Spacer()
                
                Group {
                    if self.loading {
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    } else {
                        Image(systemName: "arrow.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(rotation)
                            .opacity(0.6)
                    }
                }
                .frame(width: height * 0.2, height: height * 0.5)
                .fixedSize()
                .offset(y: (loading && frozen) ? 0 : -height)
                
                Spacer()
            }
            .frame(height: height)
            
        }
    }
}

struct MCRefreshablePreferenceTypes {
    enum ViewType: Int {
        case fixedPositionView
        case movingPositionView
    }
    
    struct MCRefreshablePreferenceData: Equatable {
        let viewType: ViewType
        let bounds: CGRect
    }
    
    struct MCRefreshablePreferenceKey: PreferenceKey {
        static var defaultValue: [MCRefreshablePreferenceData] = []
        
        static func reduce(value: inout [MCRefreshablePreferenceData], nextValue: () -> [MCRefreshablePreferenceData]) {
            value.append(contentsOf: nextValue())
        }
    }
}
