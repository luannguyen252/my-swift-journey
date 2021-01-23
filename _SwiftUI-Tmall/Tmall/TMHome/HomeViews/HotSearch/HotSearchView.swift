//
//  HotSearchView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct HotSearchView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            /// 背景图
            HotSearchBackGround()
            
            HStack(alignment: .center, spacing: 10) {
                
                VStack {
                    /// cell数据
                    HotSearchCell(productname: "韩版修身西裤榜", detail: "已下单899件", imageName: "01")
                    HotSearchCell(productname: "流程面卡顿膜榜", detail: "已下单3千件", imageName: "04")
                    
                    HotSearchCell(productname: "冬日的都能量榜", detail: "已下单99件", imageName: "06")
                }
         
                .padding(.init(top: 50, leading: 25, bottom: 0, trailing: -10))
                VStack {
                    /// cell数据
                    HotSearchCell(productname: "创意各项餐具榜", detail: "已下单128件", imageName: "08")
                    HotSearchCell(productname: "好吃的粮是食榜", detail: "已下单1.2万件", imageName: "10")
                    
                    HotSearchCell(productname: "儿童松开零食榜", detail: "已下单18件", imageName: "12")
                }
            
                .padding(.init(top: 50, leading: 20, bottom: 0, trailing: -5))
                
            }
            
        }
    }
}

struct HotSearchBackGround: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            Image("hotsearchbottom")
                .resizable()
                .frame( height: 180)
                .background(Color.clear)
                .padding(.top,50)
            Image("hotsearchtop")
                .resizable()
                .frame( height: 50)
                .background(Color.clear)

            Image("hotsearchbottom")
                .resizable()
                .frame( height: 180)
                .background(Color.clear)
                .padding(.top,130)
            
        }
    }
}





#if DEBUG
struct HotSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HotSearchView()
    }
}
#endif
