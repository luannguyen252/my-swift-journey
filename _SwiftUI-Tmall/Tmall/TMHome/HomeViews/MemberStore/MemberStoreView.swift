//
//  MemberStoreView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI


/// 天猫会员店
struct MemberStoreView: View {
    var body: some View {
       ZStack(alignment: .top) {
              Image("floor2")
                .resizable()
                .frame(height: 180)
              VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 5) {
                    Text("天猫会员店")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.black)
                    Text("天天平价")
                        .font(Font.system(size: 14))
                        .foregroundColor(.gray)
                    Text("越买越划算")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color(red: 133/255.0, green: 133/255.0, blue: 133/255.0))
                    Spacer()
                   
                    
                    NavigationLink(destination: BestSaleView()) {
                        Text("进店逛逛")
                            .font(Font.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Image("alu_tables_arrow")
                    .resizable()
                        .frame(width: 10, height: 10)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5 ))
                }
                .padding(.init(top: 18, leading: 18, bottom: 10, trailing: 15))
   
                MemberStoreBottomView().padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
              }
       }.background(Color.clear)
    }
}

#if DEBUG
struct MemberStoreView_Previews: PreviewProvider {
    static var previews: some View {
        MemberStoreView()
    }
}
#endif
