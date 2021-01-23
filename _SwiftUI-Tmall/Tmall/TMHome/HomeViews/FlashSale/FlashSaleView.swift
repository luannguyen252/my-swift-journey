//
//  FlashSaleView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct FlashSaleView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("flashsalebg")
                .resizable()
                .frame(height: 420)
            
            VStack(alignment: .center, spacing: 5) {
                HStack {
                    
                    FlashSaleCellView(title: "限时抢购", leftImage: "01", rightImage: "02", lefttxt: "爆款直降", rigghttxt: "限时特价", txtColor: Color.red)
                    FlashSaleCellView(title: "天猫好物", leftImage: "03", rightImage: "04", lefttxt: "好货必买", rigghttxt: "好货必买", txtColor: Color.orange)
                }
                HStack {
                    
                    FlashSaleCellView(title: "聚划算", leftImage: "05", rightImage: "06", lefttxt: "抢100元券", rigghttxt: "抢50元券", txtColor: Color.red)
                    FlashSaleCellView(title: "天猫闪降", leftImage: "07", rightImage: "08", lefttxt: "已降30元", rigghttxt: "已降31元", txtColor: Color.red)
                }
                FlashSaleBottomCell().padding(.top,5)
            }

        }
        .background(Color.clear)

    }
}

#if DEBUG
struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView()
    }
}
#endif
