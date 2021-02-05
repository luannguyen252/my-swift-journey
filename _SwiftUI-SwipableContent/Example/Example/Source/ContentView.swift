//
//  ContentView.swift
//  Example
//
//  Created by Sudarshan Sharma on 11/26/20.
//

import SwiftUI
import SwipableContent

struct ContentView: View {
    var contentData = [RowContent(text: "Headphones",
                                   systemImageName: "headphones",
                                   description: "Category - Music",
                                   configurations: [ContextualViewConfiguration(text: Text("Delete"),
                                                                                image: Image(systemName: "trash"),
                                                                                backgroundColor: Color.red) {
                                        print("Row 1 - Delete")
                                   },
                                   ContextualViewConfiguration(text: Text("Add"),
                                                               image: Image(systemName: "bag.badge.plus"),
                                                               backgroundColor: Color(UIColor(named: "UFOGreen")!)) {
                                        print("Row 1 - Add")
                                   },
                                   ContextualViewConfiguration(text: Text("Buy"),
                                                               image: Image(systemName: "creditcard"),
                                                               backgroundColor: Color(UIColor(named: "BlueMarina")!)) {
                                        print("Row 1 - Buy")
                                   }]),
                       RowContent(text: "Airplane",
                                  systemImageName: "airplane",
                                  description: "Category - Transportation",
                                  configurations: [ContextualViewConfiguration(text: Text("Buy"),
                                                                               image: Image(systemName: "dollarsign.circle"),
                                                                               backgroundColor: Color(UIColor(named: "CarminePink")!)) {
                                        print("Row 2 - Buy")
                                  },
                                  ContextualViewConfiguration(text: Text("Dock"),
                                                              image: Image(systemName: "rectangle.dock"),
                                                              backgroundColor: Color(UIColor(named: "RadiantYellow")!)) {
                                        print("Row 2 - Dock")
                                  }]),
                       RowContent(text: "Game Controller",
                                   systemImageName: "gamecontroller",
                                   description: "Category - Consumer Electronics",
                                   configurations: [ContextualViewConfiguration(text: Text("Tag"),
                                                                                backgroundColor: Color(UIColor(named: "CoolGray")!)) {
                                         print("Row 3 - Tag")
                                   }])]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(0..<contentData.count, id: \.self) { index in
                        SwipableContentView {
                            ItemView(content: contentData[index])
                                .if(contentData[index].configurations != nil) {
                                    $0.onTrailingSwipe(configurations: contentData[index].configurations!)
                                }
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
                Section {
                    SwipableContentView {
                        ItemView(content: RowContent(text: "Text Formatting",
                                                     systemImageName: "pencil.tip.crop.circle",
                                                     description: "Category - Edit",
                                                     configurations: [ContextualViewConfiguration(text: Text("Edit"),
                                                                                                  image: Image(systemName: "pencil.and.outline"),
                                                                                                  backgroundColor: Color(UIColor(named: "CoolGray")!)) {
                                                           print("Row 4 - Edit")
                                                     }]))
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("Inbox"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
