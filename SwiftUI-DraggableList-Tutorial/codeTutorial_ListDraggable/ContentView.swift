//
//  ContentView.swift
//  codeTutorial_ListDraggable
//
//  Created by Christopher Guirguis on 3/25/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var recipeSteps = ["Pour flour", "Crack eggs into a bowl and whisk thoroughly until the whites and the yolks are completely mixed.", "Peel potato"]
    @State var editingList = false
    var body: some View {
        List{
            ForEach(0..<recipeSteps.count){i in
                Text("\(i). \(self.recipeSteps[i])")
                .padding(EdgeInsets.init(top: 3, leading: 6, bottom: 3, trailing: 6))
                .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(5)
                .lineLimit(nil)
            }.onMove(perform: move)
            .onLongPressGesture {
                withAnimation{
                    self.editingList = true
                }
            }
            
        }.environment(\.editMode, editingList ? .constant(.active) : .constant(.inactive))
    }
    
    func move(fromOffsets source: IndexSet, toOffsets destination: Int) {
        recipeSteps.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            editingList = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
