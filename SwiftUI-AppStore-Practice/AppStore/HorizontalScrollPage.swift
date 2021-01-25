//
//  HorizontalScrollView.swift
//  AppStore
//
//  Created by jb on 2020/10/08.
//

import Foundation
import SwiftUI

struct HorizontalScrollView: View {
    var items: [GameData]
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Games to play this week").font(Font.system(size: 25)).bold()
                    Text("Selected by the editors").font(Font.caption).foregroundColor(.gray)
                }
                Spacer()
                Button(action: self.seeAll, label: {
                    Text("See All")
                })
            }.padding()
            ScrollView(.horizontal, showsIndicators: false){
                ForEach(0 ..< 3){
                    row in
                    HStack{
                        ForEach(0 ..< items.count / 3){
                            column in
                            GameCell(data : self.items[self.determineCurrentCell(row: row, columnn: column)])
                        }
                    }
                }
            }
        }
    }
    func determineCurrentCell(row: Int, columnn: Int) -> Int {
        return (((columnn+1) * 3)-row)-1
    }
    
    func seeAll(){
        
    }
}

struct GameCell: View {
    var data: GameData
    var hasInAppPurchase : Bool = true
    var body: some View{
        HStack{
            Image(data.image).resizable().frame(width: 60, height: 60, alignment: .leading).cornerRadius(15)
            VStack(alignment: .leading) {
                Text(data.title).font(Font.system(size: 20))
                Text(data.subTitle).font(.system(size: 15)).foregroundColor(.gray)
            }
            Spacer()
            VStack(spacing: 5){
                Button(action: self.get, label: {
                    Text("Get").padding(EdgeInsets.init(top: 3, leading: 20, bottom: 3, trailing: 20)).background(Color.gray.opacity(0.3)).cornerRadius(10)
                })
                
                if hasInAppPurchase == true{
                    Text("In-App Purchases").font(.system(size: 10)).foregroundColor(.gray)
                }
            }
        }.padding().frame(width: 320, alignment: .leading)
    }
    func get(){
        
    }
}


struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView(items: GameStorage().thisWeeksGames)
    }
}
