//
//  HomeView.swift
//  SlideIn
//
//  Created by Sud on 6/23/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    @State private var shouldMoveOffset = false
    @Binding var selectedColor: Color
    @Binding var showSideMenu: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(selectedColor)
                .gesture(DragGesture().onEnded({ _ in
                    self.showSideMenu.toggle()
                }))
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: 50.0)
                HStack {
                    Button(action: {
                        self.showSideMenu.toggle()
                    }, label: {
                        Image(systemName: showSideMenu ? "multiply" : "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                            .rotationEffect(.degrees(showSideMenu ? 0 : 180))
                            .animation(.spring())
                    })
                        .padding(.leading, 20.0)
                    Spacer()
                }
                Spacer()
                
                Text("Slide In")
                .foregroundColor(Color.white)
                .font(.system(size: 70))
                .fontWeight(Font.Weight.ultraLight)
                Spacer()
            }

            
        }
        .edgesIgnoringSafeArea(.all)
        .shadow(color: Color.gray, radius: 10.0, x: 0.0, y: 0.0)
        .offset(x: showSideMenu ? UIScreen.main.bounds.size.width - 60.0 : 0.0, y: 0.0)
        .animation(.spring())
    }
}
