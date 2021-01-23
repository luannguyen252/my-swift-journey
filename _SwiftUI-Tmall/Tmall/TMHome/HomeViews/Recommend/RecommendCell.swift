//
//  RecommendCell.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct RecommendCell: View {
    var item: RecommendItem
    var body: some View {
        
        ZStack(alignment: .top ) {
            RecommendCellBackGroundView()
                .frame(height: 280)
            
            HStack(alignment: .center, spacing: 0) {
                
                ForEach(item.productList,id: \.self) {
                    product in
                    RecommendCellView(product: product)
                }
                
            }
        }
        
        
    }
        

}

struct RecommendCellBackGroundView: View {
    var body: some View {
        
        /// 背景视图
        ZStack {
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 15) {
                    Color(.white)
                        .frame(width: (geometry.size.width - 40)/2, height: 280, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 237/255.0, green: 237/255.0, blue: 237/255.0), radius: 5)
                    
                    Color(.white)
                        .frame(width: (geometry.size.width - 40)/2, height: 280, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 237/255.0, green: 237/255.0, blue: 237/255.0), radius: 5)
                }
            }
            
        }
        
    }
    
}

struct RecommendCellView: View {
    var product: RecommendProductList
    
    var body: some View {

        VStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 175, height: 175, alignment: .center)
                .padding(.top,5)
            Text(product.productName)
                .font(.system(size: 15))
                .foregroundColor(Color.black)
                .padding(.leading,20)
                .padding(.trailing,20)
            HStack {
                Image("TB1a4C4cq1s3KVjSZFAXXX_ZXXa-230-44")
                    .resizable()
                    .frame(width: 60,height: 15)
                    .padding(.leading,20)
                Spacer()
            }
            HStack {
                Text(product.price)
                    .font(.system(size: 15))
                    .foregroundColor(Color.red)
                    .padding(.leading,20)
                Spacer()
                Text("看相似")
                    .font(.system(size: 10))
                    .foregroundColor(Color.red)
                .background(UIColorFromRGB("#FFC0CB")
                    .cornerRadius(10)
                    .padding(.init(top: -1, leading: -5, bottom: -1, trailing: -5))
                )
                    .padding(.trailing,20)
              
            }
        
        }

    }
}

#if DEBUG
struct RecommendCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendCell(item: recommendData[0])
    }
}
#endif
