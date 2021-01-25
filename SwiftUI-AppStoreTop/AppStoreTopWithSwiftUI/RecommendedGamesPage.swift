//
//  RecommendedGamesPage.swift
//  AppStoreTopWithSwiftUI
//
//  Created by park kyung suk on 2020/06/27.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI


struct RecommendedGamesPageView: View {
    
    var items: [GameData]
    let numOfRows = 3
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text("おすすめの新着ゲーム").font(.system(size: 24)).bold()
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("すべて表示")
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(0 ..< numOfRows) { row in
                    HStack {
                        // self.itemsの数を 3行にするので /3 すること
                        ForEach(0 ..< self.items.count / 3) { column in
                            GameCell(data: self.items[self.determineCurrentCell(row: row, column: column)], index: self.determineCurrentCell(row: row, column: column)).frame(width: 250)
                        }
                    }
                }
            }
        }.padding()
    }
    // 0 - row0 col0  -->  0 - row0 col0
    // 0 - row0 col1  -->  0 - row0 col0
    // 0 - row0 col2  -->  0 - row0 col0
    // 0 - row0 col3  -->  0 - row0 col0
    
    // 1 - row1 col0  -->  0 - row0 col0
    // 1 - row1 col1  -->  0 - row0 col0
    // 1 - row1 col2  -->  0 - row0 col0
    // 1 - row1 col3  -->  0 - row0 col0
    
    // 2 - row2 col0  -->  0 - row0 col0
    // 2 - row2 col1  -->  0 - row0 col0
    // 2 - row2 col2  -->  0 - row0 col0
    // 2 - row2 col3  -->  0 - row0 col0
    
    
    // 0  3  6  9
    // 1  4  7  10
    // 2  5  8  11
    func determineCurrentCell(row: Int, column: Int) -> Int {
        // 0 3 6 9  -  1 4 7 10  -  2 5 8 11

        return row + column * 3
    }
}

struct GameCell: View {
    
    let data: GameData
    let index: Int
    
    var body: some View {
        HStack {
            Image("app-icon").resizable().frame(width: 50, height: 50, alignment: .leading).cornerRadius(10)
            
            VStack (alignment: .leading) {
                Text("index: \(index)")
                Text(data.subTitle).foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct RecommendedGamesPageView_Preview: PreviewProvider {
    static var previews: some View {
        RecommendedGamesPageView(items: [GameData(id: UUID(), title: "", subTitle: "", image: "")])
    }
}
