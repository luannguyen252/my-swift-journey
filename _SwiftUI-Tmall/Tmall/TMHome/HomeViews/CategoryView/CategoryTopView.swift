//
//  CategoryTopView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct CategoryTopView: View {
    /// 分类数组
    var categorys = categoryData
    
    @EnvironmentObject var home: HomeGlobal
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            /// 横屏滚动
            ScrollView(.horizontal, showsIndicators: false) {
                /// 用于接收监听的视图
                MovingView()
                /// 水平显示
                HStack(alignment: .top, spacing: 0) {
                    
                    /// 遍历列表
                    ForEach(categorys, id: \.self) { category in
                        /// 单个视图
                        CategorySingle(category: category)
                            .frame(width: 75, height: 70, alignment: .center)
                            .background(Color.clear)
                        }
                }
                
            }.padding(.init(top: 15, leading: 15, bottom: 0, trailing: 15))
                .onPreferenceChange(RefreshableKeyTypes.PreKey.self) { values in
                    
                    /// 更新赋值
                    self.home.categoryX = CGFloat((values.first?.bounds.origin.x ?? 0.0) - 15.0)
                    print(self.home.categoryX)
                    if self.home.categoryX < -140 {
                        
                    }
            }
                
     
        }
        
        
    }
}

struct CategorySingle: View {
    // 分类模型数据
    var category: CategoryItem
    
    
    var body: some View {
        ZStack {   // 垂直布局
            /// 分类图片
            Image(category.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.top,-15)
            
            NavigationLink(destination: WebContainView(html: category.html)) {
                /// 分类名称
                Text(self.category.category)
                    .padding(.top,50)
                    .frame(height:70)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .background(Color.clear)
            }
        }.background(Color.clear)
    }
}



#if DEBUG
struct CategoryTopView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTopView().environmentObject(HomeGlobal())
    }
}
#endif
