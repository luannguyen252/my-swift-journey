//
//  ThemeChoiceCell.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct ThemeChoiceCell: View {
    
    var item: ThemeChoiceItem

    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(item.title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                Text(item.detail)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }.padding(.leading,30)
                .frame(width: 150)
            Color(red: 230/255.0, green: 230/255.0, blue: 230/255.0)
                .frame(width: 1, height: 40, alignment: .leading)
            Spacer()
            HStack {
                /// 右侧产品列表
                ForEach(item.productList,id: \.self) { product in
                    
                   ThemeChoiceRightView(product: product)
                    
                }
            }.padding(.trailing,30)
         
        }.background(Color.clear)
        .frame( height: 89)
      
    }
}


struct ThemeChoiceRightView: View {
    var product: ThemeChoiceProductList
    var body: some View {
        
        VStack {
            /// 图片
            Image(product.imageName)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            /// 产品名称
            Text(product.productName)
                .font(.system(size: 12))
                .foregroundColor( UIColorFromRGB(product.colorTitle))
                .background(
                    UIColorFromRGB(product.colorBg)
                        .cornerRadius(10)
                        .padding(.init(top: -1, leading: -5, bottom: -1, trailing: -5))
            )
            
        }
    }
}

#if DEBUG
struct ThemeChoiceCell_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChoiceCell(item: themeChoiceData[1])
    }
}
#endif
