//
//  GamesPage.swift
//  AppStoreTopWithSwiftUI
//
//  Created by park kyung suk on 2020/06/27.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct GamesPageView: View {
    
    let gameStorage = GameStorage()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Today").font(.largeTitle).bold()
                    }
                    Spacer()
                    Button(action: self.loadProfile, label: {
                        Image("profile").resizable()
                            .frame(width: 40, height: 40, alignment: .trailing)
                    })
                    
                }.padding([.leading, .trailing, .top])
                
                ScrollView (.horizontal) {
                    HStack {
                        FeaturedPostPageView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from Paris", image: "sims")
                        FeaturedPostPageView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from Paris", image: "sims")
                        FeaturedPostPageView(captionText: "New Update", titleText: "The Sims Freeplay", subtitleText: "Bounjour from Paris", image: "sims")
                    }
                }
                RecommendedGamesPageView(items: gameStorage.thisWeeksGames)
                
               
            }
            
            
        }
    }
    
    func loadProfile() {
        
    }
}

struct GameStorage {
    let thisWeeksGames = [GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon"),
    GameData(id: UUID(), title: "0", subTitle: "recommended apps", image: "app-icon")]
}

struct GameData: Identifiable {
    let id: UUID
    let title: String
    let subTitle: String
    let image: String
}

struct GamesPageView_Previews: PreviewProvider {
    static var previews: some View {
        GamesPageView()
    }
}

