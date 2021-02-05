//
//  ContentView.swift
//  Habits
//
//  Created by Sandesh on 01/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: HabitsModel

    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Text("Habits")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus.app")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44, alignment: .center)
                            .cornerRadius(5.0)
                            .foregroundColor(.green)
                            
                            
                    })
                }.padding()
                
                List(model.allHabits) { habit in
                    HabbitRow(habit: habit)
                }.onAppear {
                    UITableView.appearance().separatorStyle = .none
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: HabitsModel())
            .previewDevice("iPhone 11")
    }
}
