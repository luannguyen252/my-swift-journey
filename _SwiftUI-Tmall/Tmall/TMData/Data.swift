//
//  Data.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI


/// tabbar数据
let tabBarData: [TabBarItem] = load("tabbarData.json")

/// 首页轮播图数据
let loopData: [HomeLoopItem] = load("homeLoopData.json")

/// 分类数据
let categoryData: [CategoryItem] = load("CategoryData.json")

/// 分类数据底部数据
let categoryBottomData: [CategoryBottomItem] = load("CategoryBottomData.json")

/// 天猫会员店数据底部数据
let memberStoreBottomData: [MemberStoreBottomItem] = load("MemberStoreData.json")

/// 天猫榜单数据
let BestSaleData: [BestSaleItem] = load("BestSaleData.json")

/// 天猫主题精选数据
let themeChoiceData: [ThemeChoiceItem] = load("ThemeChoiceData.json")


/// 猜你喜欢
let recommendData: [RecommendItem] = load("RecommendData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


/// Tab类型
enum TabBarType {
    case home,cat,store,me
}

let colorTM = Color(red: 255/255.0, green: 48/255.0, blue: 48/255.0)


func getRGBWithColor(_ color : UIColor) -> (CGFloat, CGFloat, CGFloat) {
    guard let components = color.cgColor.components else {
        fatalError("请使用RGB方式赋值颜色")
    }
    
    return (components[0] * 255, components[1] * 255, components[2] * 255)
}

func UIColorFromRGB(_ color_vaule : String , alpha : CGFloat = 1) -> Color {
    if color_vaule.isEmpty {
        return Color.clear
    }
    
    var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    
    if cString.count == 0 {
        return Color.clear
    }
    
    if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }
    
    if cString.count < 6 && cString.count != 6 {
        
        return Color.clear
    }
    
    let value = "0x\(cString)"
    
    let scanner = Scanner(string:value)
    
    var hexValue : UInt64 = 0
    //查找16进制是否存在
    if scanner.scanHexInt64(&hexValue) {
        print(hexValue)
        let redValue = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((hexValue & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(hexValue & 0xFF)/255.0
        return Color(red: Double(redValue), green: Double(greenValue), blue: Double(blueValue))
    }else{
        return Color.clear
    }
}
