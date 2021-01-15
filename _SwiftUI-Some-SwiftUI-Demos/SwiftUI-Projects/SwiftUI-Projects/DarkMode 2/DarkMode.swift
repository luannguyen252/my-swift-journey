//
//  DarkMode.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/9.
//

import SwiftUI

struct DarkMode: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var isLight: Bool {
        colorScheme == .light
    }
    
    
    var body: some View {
        ZStack {
            Color(isLight ? .white : .black)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Now, is")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(isLight ? Color.black : Color.white)
                    Text(isLight ? "Light" : "Dark")
                        .font(.system(size: 150, weight: .regular))
                        .foregroundColor(isLight ? Color.black : Color.white)
                        .multilineTextAlignment(.leading)
                }.padding(.leading, 20)
                Spacer()
            }
        }
        
    }
}


struct DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkMode()
                .environment(\.colorScheme, .light)
            DarkMode()
                .environment(\.colorScheme, .dark)
        }
    }
}
