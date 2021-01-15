//
//  ContentView.swift
//  customNav_programmaticNav
//
//  Created by Christopher Guirguis on 2/28/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.edgesIgnoringSafeArea(.all)
                NavigationLink(destination: DestinationView(isDestination: true)){
                        Text("Go to destination")
                }
            }
            
        }
        
    }
}

struct DestinationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var isDestination = false
    
    var body: some View {
        
        
        
        ZStack{
            //This navigation view is just a formality.
            NavigationView{
                Text("")
            }
            .navigationBarTitle("this will be hidden")
            .navigationBarHidden(true)
            Color.clear.edgesIgnoringSafeArea(.all)
            Text("we are at the destination")
            CustomNavigationView(isDestination:isDestination)
        }
        
        
    }
}

struct CustomNavigationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var isDestination = false
    
    var title = "Nachrichten"
    var buttons:[Button<Image>] = [
        Button(action: {}) {
            Image(systemName: "ellipsis.circle.fill")
        },
        Button(action: {}) {
            Image(systemName: "square.and.pencil")
        }
    ]
    
    
    var body: some View {
        VStack{
            HStack{
                
                if isDestination {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                }
                
                Text(title)
                    .font(.system(size: 35, weight: .bold))
                Spacer()
                ForEach(0..<buttons.count){ i in
                    self.buttons[i]
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
