//
//  CategoryBottomView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct CategoryBottomView: View {
 /// 分类数组
    var categorys = categoryBottomData
    var body: some View {
        
            /// 水平显示
            HStack {
                
                /// 遍历列表
                ForEach(categorys, id: \.self) { category in
                    /// 单个视图
                    CategoryDown(category: category)

                    
                }
            }
    }
}

/// 分类底部视图
struct CategoryDown: View {
      // 分类模型数据
      var category: CategoryBottomItem
      
      
      var body: some View {
        
        HStack {
           
            CategoryTextDown(category: category)
                .frame(width: 60, height: 40, alignment: .leading)
            /// 分类图片
            Image(category.imageName)
                .resizable()
                .frame(width: 40, height: 40)
        }
        
        
        
      }
}


struct CategoryTextDown: View {
      // 分类模型数据
      var category: CategoryBottomItem
      
      
      var body: some View {

        VStack(alignment: .leading, spacing: 0) {   // 垂直布局
                
                /// 分类名称
                Text(category.category)
                    .font(.system(size: 11))
                    .foregroundColor(.black)
                /// 分类描述
                Text(category.detail)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                
            }
        
      }
}

#if DEBUG
struct CategoryBottomView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBottomView()
    }
}
#endif
