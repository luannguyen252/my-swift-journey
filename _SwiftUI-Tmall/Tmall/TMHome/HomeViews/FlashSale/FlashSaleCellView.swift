//
//  FlashSaleCellView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/26.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct FlashSaleCellView: View {
    
    var title: String
    var leftImage: String
    var rightImage: String
    var lefttxt: String
    var rigghttxt: String
    var txtColor : Color
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.leading,30)
                    .padding(.top,15)
                    .font(.system(size: 16, weight: .bold, design: .default))
                Spacer()
            }
 
            HStack {
                VStack {
                    Image(leftImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                    Text(lefttxt)
                        .font(.system(size: 13))
                        .padding(1)
                        .border(txtColor, width: 1)
                        .foregroundColor(txtColor)
                }
                VStack {
                    Image(rightImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                    Text(rigghttxt)
                        .font(.system(size: 13))
                        .padding(1)
                        .border(txtColor, width: 1)
                        .foregroundColor(txtColor)
                }
                
                
            }.frame(height: 110)
            .padding(.top,-10)
            
        }.background(Color.clear)
    }
}

#if DEBUG
struct FlashSaleCellView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleCellView(title: "限时抢购", leftImage: "waimai", rightImage: "waimai", lefttxt: "waimai", rigghttxt: "waimai", txtColor: Color.red)
    }
}
#endif
