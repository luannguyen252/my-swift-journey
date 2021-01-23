//
//  HomeGlobal.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/30.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import Foundation
import SwiftUI

public class HomeGlobal: ObservableObject {
    
    /// 首页滚动的x轴偏移量
    @Published var offsetX: CGFloat = 0.0
    
    /// 首页滚动的y轴偏移量
    @Published var offsetY: CGFloat = 0.0
    
    /// 首页滚动的index
    @Published var index: Int = 0
    
    /// 整体宽度
    @Published var width: CGFloat = 0.0
    
    /// 分类滑动的x轴偏移量
    @Published var categoryX: CGFloat = 0.0
    
}
