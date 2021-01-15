//
//  ContentView.swift
//  codeTutorial_slidingMenu
//
//  Created by Christopher Guirguis on 4/3/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [  MenuButton(text: "Saved", sfsymbol: "bookmark", action: {print("potato")}),
                     MenuButton(text: "Edit Profile", sfsymbol: "pencil.circle", action: {print("you pressed the save button")}),
                     MenuButton(text: "Settings", sfsymbol: "gear", action: {print("you pressed the save button")}),
                     MenuButton(text: "Discover", sfsymbol: "star", action: {print("you pressed the save button")}),
                     MenuButton(text: "Contact", sfsymbol: "quote.bubble", action: {print("you pressed the save button")}),
                     MenuButton(text: "Sign-Out", sfsymbol: "square.lefthalf.fill", action: {print("you pressed the save button")})
    ]
    @State var menuShown = false
    
    var body: some View {
        ZStack{
            SlidingMenuView(buttons: buttons)
            //Foreground View
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
                    HStack {
                        Button(action: {self.menuShown.toggle()}) {
                            Image(systemName: "ellipsis")
                            .padding()
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .scaleEffect(menuShown ? 0.8 : 1)
            .offset(x: menuShown ? 200 : 0)
            .animation(.easeInOut(duration: 0.2))
        .shadow(radius: 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
