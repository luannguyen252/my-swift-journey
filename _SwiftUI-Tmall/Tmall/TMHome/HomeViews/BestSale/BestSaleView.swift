//
//  BestSaleView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct BestSaleView: View {
    
    /// 数据
    var bestData = BestSaleData
    
    var body: some View {
        VStack {
            HStack {
                Text("天猫榜单")
                    .font(.system(size: 19, weight: .semibold, design: .default))
                    .padding(.leading,20)
                
                Spacer()
            }
            
            ZStack {
                Image("TB1Di6SUH2pK1RjSZFsXXaNlXXa-1125-432")
                    .resizable()
                    .frame( height: 180)
                HStack(alignment: .top, spacing: 10) {
                    
                    /// 列表
                    ForEach(bestData,id: \.self) { best in
                        
                        /// cell视图
                        BestSaleCell(item: best)
                            .frame(width: 120,height: 150)
                        
                    }
                    
                }
                
            }.padding(.top,-15)
            
        }
    }
}


struct BestSaleCell : View {
    
    var item : BestSaleItem
    
    var body: some View {
        ZStack(alignment: .top) {
            
            /// 白色背景
            Color(.white)
            
            /// 商品图片
            ImageStore.shared.image(name: item.imageName)
                .resizable()
                .frame(width: 90, height: 90)
                .padding(.top,30)
            
            /// 顶部图片
            Image(item.top)
                .resizable()
            ZStack(alignment: .bottom) {
                
                /// 底部图片
                Image(item.bottom)
                    .resizable()
                
                /// 商品名称
                Text(item.category)
                    .padding(.bottom,10)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            
        }
     
    }
    
}

#if DEBUG
struct BestSaleView_Previews: PreviewProvider {
    static var previews: some View {
        BestSaleView()
    }
}
#endif
