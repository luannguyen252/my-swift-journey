//
//  ContentView.swift
//  codeTutorial_CustomActionSheet
//
//  Created by Christopher Guirguis on 3/27/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShown = false
    @State var textFieldVal = ""
    @State var filters:[String] = []
    
    var body: some View {
        ZStack{
            VStack{
                Text("Filters = \(filters.description)")
                Button(action: {
                    self.isShown.toggle()
                }){
                    Text("Create New Filter")
                }
            }
            HalfModalView(isShown: $isShown, color: .clear){
                VStack{
                    TextField("Subreddit", text: self.$textFieldVal)
                        .frame(height:30)
                        .padding(EdgeInsets(top: 8, leading : 10, bottom: 8, trailing: 10 ))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                    )
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.init(red: 0.9, green: 0.9, blue: 0.9))
                    )
                    VStack(spacing:0){
                        Button(action: {
                            
                            if self.textFieldVal != "" {
                                self.filters.append(self.textFieldVal)
                            }
                            self.hideModal()
                        }){
                            Text("Add Filter")
                            .frame(height:70)
                        }
                        Rectangle()
                            .frame(height:1)
                            .foregroundColor(.init(white: 0.7))
                        Button(action: {
                            self.hideModal()
                        }){
                            Text("Cancel")
                            .frame(height:70)
                                .foregroundColor(.red)
                        }
                    }.font(.system(size: 25))
                    .background(Color.init(white: 0.9))
                    .cornerRadius(20)
                }
                
            }
        }
    }
    
    func hideModal(_ emptyModal:Bool = true){
        
        self.isShown = false
        UIApplication.shared.endEditing()
        if emptyModal {
            textFieldVal = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
