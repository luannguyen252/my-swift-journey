//
//  TMHomeView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMHomeView: View {
    
    @State private var refresh: Bool = true
    @EnvironmentObject var home: HomeGlobal
    
    
    var body: some View {
        
        /// 导航总试图
        NavigationView {
            
            /// 整体叠加
            ZStack(alignment: .top) {
                
                /// 首页背景视图
                TMHomeBackView()
                
                /// 滚动视图
                RefreshScrollView(refreshing: $refresh) {
                    HomeContentView()
                }
                
                /// 顶部导航
                HomeNaviView()
 
            }
                /// 背景颜色
                .background(Color(red: 245/255.0, green: 245/255.0, blue: 245/255.0))
                /// 延伸到安全区域
                .edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
        }
        
        
    }
}

struct HomeContentView: View {
    var body: some View {
        
        VStack {
            /// 轮播图
            PageView(loopData.map { LoopCardView(loop: $0) })
            
            /// 分类
            CategoryView().padding(.top,0)

            /// 天猫会员店
            MemberStoreView().padding(.top,-20)

            /// 限时抢购
            FlashSaleView().padding(.top,-20)

            /// 天猫榜单
            BestSaleView().padding(.top,-10)

            /// 热搜榜
            HotSearchView()

            /// 主题精选
            ThemeChoiceView()

            /// 猜你喜欢
            RecommendView()
        }
    }
    
}

#if DEBUG
struct TMHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TMHomeView().environmentObject(HomeGlobal())
    }
}
#endif
