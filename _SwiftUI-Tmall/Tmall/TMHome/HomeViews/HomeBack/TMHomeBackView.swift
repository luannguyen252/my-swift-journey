//
//  TMHomeBackView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/30.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct TMHomeBackView: View {
    
    @EnvironmentObject var home: HomeGlobal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("loopbg")
                .resizable()
                .frame(height: 450)
                .background(Color.init(getColor()))
            
        }
        .offset(x: 0, y: self.home.offsetY <= 0 ? self.home.offsetY : 0)
    }
    
    func getColor() ->  UIColor{
        
        /// 当前页
        let current = self.home.index
        
        /// 获取下一页的索引
        var nextIndex: Int = current
        
        
        /// 滑动比例
        let progress: CGFloat = abs((self.home.offsetX - self.home.width)/self.home.width)

        /// 滑动方向
        if self.home.offsetX - self.home.width >= 0 {
            nextIndex += 1
            if nextIndex > 9 {
                nextIndex = 0
            }
            if self.home.offsetX - self.home.width == 0 {
                nextIndex = 0
            }
        } else {
            
            nextIndex -= 1
            if nextIndex < 0 {
                nextIndex = 9
            }
            if  current == 0 {
                nextIndex = 0
            }
        }
        
        /// 当前颜色
        let currentColor: (r : CGFloat, g : CGFloat, b : CGFloat)
            = getRGBWithColor(getRGB(current))
        
    
        /// 下一个颜色
        let nextColor: (r : CGFloat, g : CGFloat, b : CGFloat)
            = getRGBWithColor(getRGB(nextIndex))

        print("\(currentColor)==\(nextColor)")
        
        /// 颜色变量
        let colorDelta = (currentColor.0 - nextColor.0, currentColor.1 - nextColor.1, currentColor.2 - nextColor.2)
        
        let finalColr: UIColor = UIColor(red: (currentColor.0 - colorDelta.0*progress) / 255.0, green: (currentColor.1 - colorDelta.1*progress) / 255.0, blue: (currentColor.2 - colorDelta.2*progress) / 255.0, alpha: 1)
        
        return finalColr
    }
    
    func getRGB(_ index: Int) -> UIColor {
        let color =   UIColor(red: CGFloat(loopData[index].colors.red)/255.0, green: CGFloat(loopData[index].colors.green)/255.0, blue: CGFloat(loopData[index].colors.blue)/255.0, alpha: 1)
        return color
    }
}


struct TMHomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        TMHomeBackView().environmentObject(HomeGlobal())
    }
}
