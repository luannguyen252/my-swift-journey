//
//  GamesPage.swift
//  AppStore
//
//  Created by jb on 2020/10/08.
//

import Foundation
import SwiftUI
import Pages

struct GamesView: View {
    var gameStorage = GameStorage()
    var numOfRows = 3
    @State
    var currentPage=0
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Today").font(Font.largeTitle).bold()
                    }
                    Spacer()
                    Button(action: self.loadProfile, label: {
                        Image("Profile").resizable().frame(width: 40, height: 40, alignment: .trailing)
                    })
                    
                }.padding([.leading, .trailing, .top])
                
                Pages(currentPage: $currentPage, bounce: true, hasControl: false, pages: {
                        FeaturedPostView(captionText: "New Update", titleText: "Instruments FreePlay", subTitleText: "Play Any Instrument You Want!", image: "sims")
                        
                        FeaturedPostView(captionText: "New Update", titleText: "Instruments FreePlay", subTitleText: "Play Any Instrument You Want!", image: "sims")
                        
                        FeaturedPostView(captionText: "New Update", titleText: "Instruments FreePlay", subTitleText: "Play Any Instrument You Want!", image: "sims")
                        
                        FeaturedPostView(captionText: "New Update", titleText: "Instruments FreePlay", subTitleText: "Play Any Instrument You Want!", image: "sims")
                }).frame(height: 350, alignment: .center)
                    
                Divider()
                
                ForEach(0..<3, content : {
                    row in
                    HorizontalScrollView(items: self.gameStorage.thisWeeksGames)
                })
                
            }
        }
    }
    func loadProfile(){
        
    }
}

struct GameStorage {
    var thisWeeksGames = [
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there"),
        GameData(id: UUID(), title: "DJApp", image: "logo", subTitle: "The Best Game app out there")
    ]
}

struct GameData: Identifiable {
    var id = UUID()
    var title = String()
    var image = String()
    var subTitle = String()
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
