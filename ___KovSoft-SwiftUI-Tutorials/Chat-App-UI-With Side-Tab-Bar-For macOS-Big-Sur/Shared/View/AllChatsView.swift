//
//  AllChatsView.swift
//  Telegram_MacApp
//
//  Created by Balaji on 06/01/21.
//

import SwiftUI

struct AllChatsView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        
        // Side Tab View....
        VStack {
            
            
            HStack{
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $homeData.search)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.vertical,8)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            
            List(selection: $homeData.selectedrecentMsg){
                
                ForEach(homeData.msgs){message in
                    
                    // Message View...
                    NavigationLink(
                        destination: DetailView(user: message),
                        label: {
                            
                            RecentCardView(recentMsg: message)
                        })
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
