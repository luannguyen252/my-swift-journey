//
//  ChangeCALayerToUIImage.swift
//  SimpleCameraApp
//
//  Created by RyoNishimura on 2020/09/05.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import UIKit

extension UIView {
    
    func image() -> UIImage {
        /*
         UIGraphicsImageRenderer:CoreGraphicsを利用した画像を作成するためのグラフィックレンダラー
         .bounds:独自の座標系でのビューの位置とサイズを表す境界短形
         */
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        
        /*
         .render:レイヤーとそのサブレイヤーを指定したコンテキストにレンダリングする
         .cgContext:CGContextのメソッドでの書き方？Quartz2D描画環境
         */
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
