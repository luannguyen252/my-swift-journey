//
//  ContentView.swift
//  SwiftUI6
//
//  Created by Rohit Saini on 01/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("profilepic")
            .resizable()
            .frame(width: 120, height: 120)
            .aspectRatio(contentMode: .fit).cornerRadius(20).padding()
            .contextMenu{
                VStack{
                    Button(action: {
                        print("Save")
                    }) {
                        HStack{
                            Image(systemName: "folder.fill")
                            Text("Save to Gallery")
                        }
                    }
                    Button(action: {
                        print("Send")
                    }) {
                        HStack{
                            Image(systemName: "paperplane.fill")
                            Text("Send")
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

