//
//  TMTabBarView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMTabBarView<T: View>: View {
    /// 自控制器数组
    var viewControllers: [UIHostingController<T>]
    /// 当前选中的索引
    @State var selectedIndex = 0
    
    /// 数组
    var tabbarDatas: [TabBarItem]
    
    
    init(_ views: [T],tabbars: [TabBarItem]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self.tabbarDatas = tabbars
    }
    
    var body: some View {
//        VStack {
//            Text("当前选中的是 ： \(selectedIndex)")
//
            /// 显示Tabbar
            TMTabBarViewController(childControlls: viewControllers, tabbarDatas: tabbarDatas, selectedIndex: $selectedIndex).edgesIgnoringSafeArea(.all)
//        }

    }
}

#if DEBUG
struct TMTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        TMTabBarView([TMTabMainView(.home),TMTabMainView(.cat),TMTabMainView(.store),TMTabMainView(.me)], tabbars: tabBarData)
    }
}
#endif
