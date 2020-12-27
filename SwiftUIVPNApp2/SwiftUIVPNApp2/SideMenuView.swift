//
//  SideMenuView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct SideMenuView: View {
    @State var startAnimation = false
    @Binding var showSideMenu: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .ignoresSafeArea() // So other element behind side meue is not tappable
            
            // Two rotated rectangle
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.sideBackground)
                .rotationEffect(startAnimation ? .degrees(15) : .zero, anchor: .bottomTrailing)
                .offset(x: startAnimation ? -UIScreen.screenWidth/2 : -UIScreen.screenWidth, y: 20)
                .scaleEffect(0.85)
                .animation(Animation.easeInOut(duration: 0.5).delay(0.01))
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.sideBackground)
                .rotationEffect(startAnimation ? .degrees(10) : .zero, anchor: .bottomTrailing)
                .offset(x: startAnimation ? -UIScreen.screenWidth/2 : -UIScreen.screenWidth, y: 20)
                .scaleEffect(0.95)
                .shadow(color: .black, radius: 50)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            startAnimation.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                self.showSideMenu = false
                            }
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                    })
                }
                .offset(x: -UIScreen.screenWidth/4)
                
                // MARK: - USER VIEW
                UserView()
                
                Spacer()
                
                // MARK: - MENU LIST VIEW
                MenuListView()
                
                Spacer()
                
                // MARK: - PREMIUM VIEW
                PremiumView(fillRect: true)
                
                Spacer(minLength: 180)
            }
            .padding(.horizontal)
            .offset(x: startAnimation ? 0.0 : -UIScreen.screenWidth)
            .animation(.easeIn(duration: 0.3))
        }
        .onAppear {
            withAnimation { startAnimation.toggle() }
        }
    }
}
