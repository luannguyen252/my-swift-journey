//
//  PageView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @EnvironmentObject var home: HomeGlobal
    var viewControllers: [UIHostingController<Page>] = [UIHostingController<Page>]()
    
    /// 当前页
    @State var currentPage = 0
    
    /// 当前页的滚动x轴距离
    @State var offsetX: CGFloat = 0.0
    
    init(_ views: [Page]) {
        
        //          self.viewControllers = views.map { UIHostingController(rootView: $0) }
        
        /// 修改控制器颜色
        for item in views {
            let host = UIHostingController(rootView: item)
            host.view.backgroundColor = .clear
            self.viewControllers.append(host)
        }
        
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            /// 滑动控制器视图
            PageViewController(currentPage: $currentPage, offsetX: $offsetX, home: self.home, controllers: viewControllers)
                .background(Color.clear)
                .frame(height: 260)
            
            Text("")
                .preference(key: PageKeyTypes.PreKey.self, value: [PageKeyTypes.PreData(index: currentPage,offsetX: offsetX)])
            
            /// 新修改页数指示
            TMPageView().padding()
            
            
        }.onPreferenceChange(PageKeyTypes.PreKey.self) { values in
            self.home.index = values.first?.index ?? 0
        }
    }
    
}

/// preference类型
struct PageKeyTypes {
    
    /// preference 的value 类型
    struct PreData: Equatable{
        let index: Int
        let offsetX: CGFloat

    }
    /// preference 的 key
    struct PreKey: PreferenceKey {
        static var defaultValue: [PreData] = []

        static func reduce(value: inout [PreData], nextValue: () -> [PreData]) {
            value.append(contentsOf: nextValue())
        }
        typealias Value = [PreData]

    }

}

#if DEBUG
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(loopData.map { LoopCardView(loop: $0) }).environmentObject(HomeGlobal())
    }
}
#endif
