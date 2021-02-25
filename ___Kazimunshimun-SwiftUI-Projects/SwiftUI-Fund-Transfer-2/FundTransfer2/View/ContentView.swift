//
//  ContentView.swift
//  FundTransfer2
//
//  Created by Anik on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userSelection = UserSelection()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.background)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                //top nav
                TopNavView()
                //title
                TitleView()
                
                ZStack {
                    //hexagoan view
                    HexagoanBackgroundView()
                    
                    Button(action: {
                        //refresh users
                        withAnimation {
                            userSelection.refreshUsers()
                        }
                    }, label: {
                        RefreshView(isRefreshing: $userSelection.isRefreshing)
                    })
                    .onAppear {
                        withAnimation {
                            userSelection.refreshUsers()
                        }
                    }
                    
                    ForEach(userSelection.users) { user in
                        UserView(user: user)
                            .scaleEffect(userSelection.isRefreshing ? 0.0 : 1.0)
                            .offset(x: user.offsetValue.x, y: user.offsetValue.y)
                            .onTapGesture {
                                withAnimation {
                                    userSelection.selectUser(id: user.id)
                                }
                            }
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                SendView()
            }
            .padding(.horizontal)
        }
    }
}

extension Color {
    static let background = Color.init(red: 82/255, green: 82/255, blue: 191/255)
    static let lightPurple = Color.init(red: 93/255, green: 91/255, blue: 198/255)
    static let orangeColor = Color.init(red: 240/255, green: 125/255, blue: 81/255)
    
    static let purpleGradient = LinearGradient(gradient: Gradient(colors: [background, lightPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
