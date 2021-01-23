//
//  TabBarItem.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI
import CoreLocation

struct TabBarItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var title: String
    
    var imgNormal: String
    
    var imgSelect: String

}

struct HomeLoopItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var imgName: String
    
    var bgColor: String

    var featureImage: Image? {
         return Image(
             ImageStore.loadImage(name: imgName),
             scale: 2,
             label: Text(verbatim: imgName))
     }
    
    var backColor: Color {
        
        return UIColorFromRGB(bgColor)
    }

    var colors: ColorRGB
}

struct ColorRGB: Codable,Hashable {
    var red: CGFloat
    
    var green: CGFloat
    
    var blue: CGFloat
}

struct CategoryItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var imageName: String
    
    var category: String
    
    var html: String
    

}

struct CategoryBottomItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var imageName: String
    
    var category: String
    
    var detail: String
    

}

struct MemberStoreBottomItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var imageName: String
    
    var category: String
    
    var featureImage: Image? {
            return Image(
                ImageStore.loadImage(name: imageName),
                scale: 2,
                label: Text(verbatim: imageName))
        }
}

struct BestSaleItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var imageName: String
    
    var category: String
    
    var bottom: String
    
    var top: String
    
    var featureImage: Image? {
            return Image(
                ImageStore.loadImage(name: imageName),
                scale: 2,
                label: Text(verbatim: imageName))
        }
}


struct ThemeChoiceItem: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var title: String
    
    var detail: String
    
    var productList: [ThemeChoiceProductList]
        

}

struct ThemeChoiceProductList: Hashable, Codable {
 
    
    var imageName: String
    
    var productName: String
    
    var colorTitle: String
    
    var colorBg: String
    
}

struct RecommendItem: Hashable, Codable
{

    var productList: [RecommendProductList]
}

struct RecommendProductList: Hashable, Codable {
 
    
    var imageName: String
    
    var productName: String
    
    var price: String

    
}




