//
//  ContentView.swift
//  SwiftUI32
//
//  Created by Rohit Saini on 09/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var search = ""
    @State var show = false
    var body: some View {
        VStack{
            HStack{
                if !show{
                   Text("Food").fontWeight(.heavy).foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                HStack{
                    if show{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                        Button(action: {
                            withAnimation() {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "xmark").foregroundColor(.black)
                        }
                    }
                    else{
                        Button(action: {
                            withAnimation() {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "magnifyingglass").foregroundColor(.black).padding(10)
                        }
                    }
                }
                .padding(show ? 10: 0)
                .background(Color.white)
                .cornerRadius(20)
                
                
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
            .padding(.horizontal)
            .padding(.bottom,10)
            .background(Color.orange)
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


