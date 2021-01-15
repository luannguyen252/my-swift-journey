//
//  SideMenuAction.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/14.
//

import SwiftUI

struct SideMenuAction: View {
    
    @State private var sideMenuActived: Bool = false
    
    var body: some View {
        
        ZStack {
            BackgroundView()
                .onTapGesture { self.sideMenuActived.toggle() }
            ZStack {
                RoundedRectangle(cornerRadius: sideMenuActived ? 25 : 0)
                    .foregroundColor(.green)
                    .shadow(radius: sideMenuActived ? 10 : 0)
                VStack {
                    HStack {
                        Button(action: {
                            self.sideMenuActived.toggle()
                        }, label: {
                            Image(systemName: "sidebar.left")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                        })
                        .padding(.top, 84)
                        .padding(.leading, 30)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .offset(x: sideMenuActived ? 300 : 0)
            .scaleEffect(sideMenuActived ? 0.7 : 1)
            .animation(.spring(response: 0.3))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.red.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SideMenuAction_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuAction()
    }
}
