//
//  RecommendView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct RecommendView: View {
    var data = recommendData
    var body: some View {
        VStack {
            HStack {
                Text("猜你喜欢")
                    .font(.system(size: 19, weight: .bold, design: .default))
                    .padding(.leading,20)
                
                Spacer()
            }
            
            VStack(alignment: .trailing, spacing: 0) {
                ForEach(data, id: \.self) { item in
                    RecommendCell(item: item)
                        .frame( height: 300)
                }
            }
            
            
        }
    }
}

#if DEBUG
struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
#endif
