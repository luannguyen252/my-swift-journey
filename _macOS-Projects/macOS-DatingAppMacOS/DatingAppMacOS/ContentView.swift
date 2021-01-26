//
//  ContentView.swift
//  DatingAppMacOS
//
//  Created by Tony Hajdini on 15/07/2020.
//  Copyright © 2020 Tony Hajdini. All rights reserved.
//

import SwiftUI

struct messageViewSender: View {
    var body: some View {
        HStack {
            Text("header")
        }
    }
}


struct messageViewRecieve: View {
    var body: some View {
        HStack {
            Text("header")
        }
    }
}


struct messageViewHeader: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("pic")
                .resizable()
                .frame(width: 50, height: 55)
                .clipShape(Circle())
            Text("header")
        }
    }
}


struct messageViewFooter: View {
 @State var message: String = ""
    var body: some View {
        HStack {
            TextField("Date Me", text: $message).padding(.horizontal, 10)
            .cornerRadius(20)
        }
    }
}


struct messageView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                messageViewHeader().frame(width: geometry.size.width, height: 54.1).background(VisualEffectView())
                ScrollView {
                    HStack(spacing: 0) {
                        VStack(spacing:0) {
                            ForEach(1 ... 55, id: \.self) { index in
                                VStack{
                                    Text("radasjdh askdhaskdhask djhaskdjsahdkasjhdask djhaskdh")
                                }.background(Color.red).frame(width: 150, height: 150, alignment: .trailing)
                            }
                        }
                    }
                }.background(Color.red)
                messageViewFooter().frame(height: 54.1).background(VisualEffectView())
            }.background(Color.yellow).edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView: View {
    
 @State var search: String = ""
    
 var body: some View {
        GeometryReader { geometry in
        HStack {
           NavigationView {
            VStack(spacing: 0) {
                        HStack {
                            
                    TextField("Search", text: self.$search)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(VisualEffectView())
                        }.padding(.horizontal, 10).padding(.vertical, 5)
                Divider().edgesIgnoringSafeArea(.all)
                        List {
                        ForEach(1 ... 20, id: \.self) { index in
                                NavigationLink(destination: messageView()) {
                                    VStack(alignment: .leading) {
                                    HStack {
                                        Image("pic")
                                        .resizable()
                                        .frame(width: 50, height: 55)
                                        .clipShape(Circle())
                                        VStack {
                                            Text("Link \(index)")
                                                .font(.caption)
                                                .bold()
                                                
                                            Text("Link \(index)")
                                                 .font(.caption)
                                                .foregroundColor(Color.gray)
                                            Spacer()
                                        }.padding(.top, 5)
                                        }
                                    }.padding(.vertical, 3)
                                }
                            }
                        }.listStyle(SidebarListStyle()).frame(minWidth: geometry.size.width / 4)
                    }
                }
            }
        }
   }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
