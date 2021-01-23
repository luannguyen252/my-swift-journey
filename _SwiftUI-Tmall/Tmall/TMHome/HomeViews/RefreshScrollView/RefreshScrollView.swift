//
//  RefreshScrollView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/30.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct RefreshScrollView<Content>: View  where Content : View {
    
    /// 首页数据全局
    @EnvironmentObject var home: HomeGlobal
    
    /// 下拉刷新高度
    var threshold: CGFloat = 80
    /// 是否刷新
    @Binding var refreshing: Bool
    
    /// 传过来的内容视图
    let content: Content
    
    /// 初始化下拉刷新视图
    init(_ height: CGFloat = 80, refreshing: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.threshold = height
        self._refreshing = refreshing
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                 ZStack(alignment: .top) {
                    /// 用于接收监听的视图
                    MovingView()
                    /// 填充传过来的视图
                    self.content
                }
            }
            .onPreferenceChange(RefreshableKeyTypes.PreKey.self) { values in
                
                /// 更新赋值
                self.home.offsetY = values.first?.bounds.origin.y ?? 0.0
                
                self.home.width = values.first?.bounds.size.width ?? 0.0
            }
        }
    }
}

struct MovingView: View {
    var body: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: RefreshableKeyTypes.PreKey.self, value: [RefreshableKeyTypes.PreData(bounds: proxy.frame(in: .global))])
        }.frame(height: 0)
    }
}

/// preference类型
struct RefreshableKeyTypes {
    
    /// preference 的value 类型
    struct PreData: Equatable {
        let bounds: CGRect
        
    }
    /// preference 的 key
    struct PreKey: PreferenceKey {
        
        /// 系统提供默认value
        static var defaultValue: [RefreshableKeyTypes.PreData] = []
        
        static func reduce(value: inout [RefreshableKeyTypes.PreData], nextValue: () -> [RefreshableKeyTypes.PreData]) {
            
            /// 添加数据
            value.append(contentsOf: nextValue())
        }
        
        /// value 类型为PreData数组
        typealias Value = [PreData]

    }
    
}
