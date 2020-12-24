//
//  ContentView.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var userSelection = UserSelection()
    
    // MARK: - BODY
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
        } //: ZSTACK
        .statusBar(hidden: true)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
