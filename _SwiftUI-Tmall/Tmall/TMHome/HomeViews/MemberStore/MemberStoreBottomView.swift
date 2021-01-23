//
//  MemberStoreBottomView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct MemberStoreBottomView: View {
    /// 分类数组
    var members = memberStoreBottomData
    var body: some View {
        
        /// 水平显示
        HStack {
            
            /// 遍历列表
            ForEach(members, id: \.self) { member in
                /// 单个视图
                MemberImageView(member: member)
            }
        }
    }
}

struct MemberImageView: View {
    // 分类模型数据
    var member: MemberStoreBottomItem
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {   // 垂直布局
                self.member.featureImage?
                    .resizable()
                    .frame(width: 60, height: 60)
                /// 分类名称
                Text(self.member.category)
                    
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 50/255.0, green: 50/255.0, blue: 50/255.0))
   
            }.frame(width: geometry.size.width, height: 90, alignment: .center)
            
        }.frame( height: 90, alignment: .center)
        
    }
}

#if DEBUG
struct MemberStoreBottomView_Previews: PreviewProvider {
    static var previews: some View {
        MemberStoreBottomView()
    }
}
#endif
