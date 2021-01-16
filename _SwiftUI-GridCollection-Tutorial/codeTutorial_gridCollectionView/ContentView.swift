//
//  ContentView.swift
//  codeTutorial_gridCollectionView
//
//  Created by Christopher Guirguis on 3/31/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var contents:[AnyView] = [
           AnyView(Image("1")
               .resizable()
               .scaledToFill()),
           AnyView(Image("2")
           .resizable()
           .scaledToFill()),
           AnyView(Image("3")
           .resizable()
           .scaledToFill()),
           AnyView(Image("4")
           .resizable()
           .scaledToFill()),
           AnyView(Image("5")
           .resizable()
           .scaledToFill()),
           AnyView(Image("6")
           .resizable()
           .scaledToFill()),
           AnyView(Image("7")
           .resizable()
           .scaledToFill()),
           AnyView(Image("8")
           .resizable()
           .scaledToFill()),
           AnyView(Image("9")
           .resizable()
           .scaledToFill()),
           AnyView(Image("10")
           .resizable()
           .scaledToFill()),
           AnyView(Image("11")
           .resizable()
           .scaledToFill()),
           AnyView(Image("12")
           .resizable()
           .scaledToFill()),
           AnyView(Image("1")
               .resizable()
               .scaledToFill()),
           AnyView(Image("2")
           .resizable()
           .scaledToFill()),
           AnyView(Image("3")
           .resizable()
           .scaledToFill()),
           AnyView(Image("4")
           .resizable()
           .scaledToFill()),
           AnyView(Image("5")
           .resizable()
           .scaledToFill()),
           AnyView(Image("6")
           .resizable()
           .scaledToFill()),
           AnyView(Image("7")
           .resizable()
           .scaledToFill()),
           AnyView(Image("8")
           .resizable()
           .scaledToFill()),
           AnyView(Image("9")
           .resizable()
           .scaledToFill()),
           AnyView(Image("10")
           .resizable()
           .scaledToFill()),
           AnyView(Image("11")
           .resizable()
           .scaledToFill()),
           AnyView(Image("12")
           .resizable()
           .scaledToFill()),
           
       ]
    var itemsPerRow = 3
    
    var body: some View {
        ScrollView{
            VStack(spacing:0){
            ForEach(0..<getRowCount(numerator: contents.count, denominator: itemsPerRow)) {i in
                RowView(itemPerRow: 3, contents: self.getRowContent(rowNumber: i, itemsPerRow: self.itemsPerRow))
            }
        }
        }
        
        
    }
    
    func getRowCount(numerator: Int, denominator: Int) -> Int {
        if numerator % denominator == 0 {
            return (numerator/denominator)
        } else {
            return (numerator/denominator) + 1
        }
    }
    
    func getRowContent(rowNumber:Int, itemsPerRow:Int) -> [AnyView] {
        var returnItems:[AnyView] = []
        for i in 0..<itemsPerRow {
            let itemIndex = (rowNumber * itemsPerRow) + i
            returnItems.append(contents[itemIndex])
        }
        
        return returnItems
        
    }
}

struct RowView: View {
    
    var itemPerRow:CGFloat
    var contents:[AnyView]
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<contents.count){i in
                self.contents[i]
                .frame(
                    width: UIScreen.main.bounds.width/self.itemPerRow ,
                    height: UIScreen.main.bounds.width/self.itemPerRow
                )
                .clipped()
                .background(Color.blue)
                
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
