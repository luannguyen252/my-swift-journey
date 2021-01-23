//
//  ThemeChoiceView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/27.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct ThemeChoiceView: View {
    var body: some View {
        VStack {
            HStack {
                Text("主题精选")
                    .font(.system(size: 19, weight: .semibold, design: .default))
                    .padding(.leading,20)
                
                Spacer()
            }
            
            ZStack(alignment: .top) {
                Image("themechoice")
                     .resizable()
                     .frame(height: 300)
                
                VStack {
                    
                    ForEach(themeChoiceData,id: \.self) { themeData in
                        ThemeChoiceCell(item: themeData).padding(.top,0)
                    }
                    
                }
                
                
         
            }
     
        }
            
    }
}


#if DEBUG
struct ThemeChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChoiceView()
    }
}
#endif
