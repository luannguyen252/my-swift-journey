//
//  SlidingMenuView.swift
//  codeTutorial_slidingMenu
//
//  Created by Christopher Guirguis on 4/3/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct MenuButton:Identifiable {
    var id = UUID()
    var text:String
    var sfsymbol:String
    var action:() -> Void
}

struct SlidingMenuView: View {
    
    var buttons:[MenuButton]
    var body: some View {
        
        HStack{
            VStack{
            Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
            ForEach(buttons, id: \.id){thisButton in
                Button(action: {thisButton.action()}){
                    HStack{
                        Image(systemName: thisButton.sfsymbol)
                        Text(thisButton.text)
                    }.padding().foregroundColor(.black)
                }
            }
                Spacer()
        }.edgesIgnoringSafeArea(.all)
            Spacer()
        }
    }
}
//
//struct SlidingMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlidingMenuView()
//    }
//}
