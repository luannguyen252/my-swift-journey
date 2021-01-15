//
//  ShapeExampleView.swift
//  TextAndImage
//
//  Created by kim sunchul on 2020/04/23.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ShapeExampleView: View {
    var body: some View {
        VStack {
            getRadialCircle()
            getAngularCircle()
            getRectangle()
        }
    }
    
    // 라디얼 그레디언트 예제
    func getRadialCircle() -> some View {
        let colors = Gradient(colors:[.red, .yellow, .green, .blue, .purple])
        let conic = RadialGradient(gradient:colors, center:.center, startRadius:50, endRadius: 200 )
        return Circle()
        .fill(conic)
        .frame(width: 400, height: 400)
    }
    
    // 앵귤러 그레디언트 예제
    func getAngularCircle() -> some View {
        let colors = Gradient(colors:[.red, .yellow, .green, .blue, .purple])
        let conic = AngularGradient(gradient:colors, center:.center )
        return Circle()
        .strokeBorder(conic, lineWidth: 50)
    }
    
    // 사각형
    func getRectangle() -> some View {
        return Rectangle()
            .fill(Color.red)
        .frame(width: 200, height: 200)
    }
}

struct ShapeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExampleView()
    }
}
