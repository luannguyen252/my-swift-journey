//
//  HomeNaviView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct HomeNaviView: View {
    
    @EnvironmentObject var home: HomeGlobal
    @State private var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            /// 顶部安全区域
            Color.init(UIColor(red: 255/255.0, green: 48/255.0, blue: 48/255.0, alpha: (-self.home.offsetY)/94.0))
                .frame(height: 44)
            
            /// 底部导航栏
            HStack {
                
                Image("camera_Normal")
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 5))
                /// 导航条位置
                HStack{
                    
                    Image("iconfont-search")
                        .padding(EdgeInsets(top: 7, leading: 5, bottom: 8, trailing: 5))
                    TextField("智能家居HongMeng", text: $name)
                    Image("tmas_entry_pop_icon")
                        .padding(EdgeInsets(top: 7, leading: 5, bottom: 8, trailing: 5))
                    
                    
                }
                .background(
                    Color.white
                        .cornerRadius(4)
                )
                    .frame(height: 50)
                
                Image("detail_button_cart")
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
                Image("frontpage_message_btn")
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                
            }
                
            .background(Color.init(UIColor(red: 255/255.0, green: 48/255.0, blue: 48/255.0, alpha: (-self.home.offsetY)/94.0)))
        }
        
    }
}

#if DEBUG
struct HomeNaviView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNaviView().environmentObject(HomeGlobal())
    }
}
#endif
