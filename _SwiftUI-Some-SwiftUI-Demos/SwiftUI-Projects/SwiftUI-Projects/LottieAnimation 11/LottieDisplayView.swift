//
//  LottieDisplayView.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/15.
//

import SwiftUI

struct LottieDisplayView: View {
    var body: some View {
        
        ZStack {
            Color.blue.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                ForEach(lottieList, id: \.self) { lottie in
                    LottieView(fileName: lottie)
                        .frame(height: 200)
                }
            }
            
        }
        
    }
}

struct LottieDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        LottieDisplayView()
    }
}
