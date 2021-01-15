//
//  ImageExampleView.swift
//  TextAndImage
//
//  Created by kim sunchul on 2020/04/21.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ImageExampleView: View {
    var body: some View {
        List {
//            기본 이미지 불러오기
            Image("all-out-donuts-thumb")
//            시스템 이미지 불러오기
            Image(systemName: "cloud.heavyrain.fill")
//            UIImage Image로 변경
            getUIImage()
//            시스템 이미지 컬러 사용
            Image(systemName: "cloud.heavyrain.fill")
                .foregroundColor(.red)
//            폰트 크기와 같이 이미지를 스케일링 할 수 있다.
            Image(systemName: "cloud.heavyrain.fill")
            .font(.largeTitle)
//            이미지 사이즈를 컨텐츠 크기에 맞게 자동으로 재조절 aspectRatio로 설정값도 주는것도 가능.
            Image("all-out-donuts-thumb")
            .resizable()
                .aspectRatio(contentMode: .fit)
//            이미지를 바둑판 형식으로 배열하거나, 여백으로 늘리는게 가능.
            Image("all-out-donuts-thumb")
                .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
        }
        
    }
    
//    UIImage -> Image
    func getUIImage() -> Image {
        guard let img = UIImage(named: "all-out-donuts-thumb") else {
            fatalError("Unable to load image")
        }
        
        return Image(uiImage: img)
    }
}

struct ImageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageExampleView()
    }
}
