//
//  ContentView.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 25/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack{
                SearchandProfileView()
                    .padding()
                HStack {
                    Text("Results")
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ResultBlocksView()
                            .frame(width: 240, height: 104)
                            .padding()
                        Spacer()
                        ResultBlocksView()
                            .frame(width: 240, height: 104)
                            .padding()
                        Spacer()
                        ResultBlocksView()
                            .frame(width: 240, height: 104)
                            .padding()
                        Spacer()
                        ResultBlocksView()
                            .frame(width: 240, height: 104)
                    }
                    
                }.padding(.bottom,-70)
                    .padding(.leading)
            }.background(Color.green)
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ElectionViewModule()
                            .padding()
                             .frame(width: 360)
                        ElectionViewModule()
                            .padding(.trailing)
                            .padding(.leading)
                         .frame(width: 360)
                        ElectionViewModule()
                            .padding()
                         .frame(width: 360)
                    }
                }
            }
            NavigationView()
                .frame(width: 420, height: 30)
                .padding(.bottom,-10)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
