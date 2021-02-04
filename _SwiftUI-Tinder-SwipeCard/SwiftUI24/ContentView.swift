//
//  ContentView.swift
//  SwiftUI24
//
//  Created by Rohit Saini on 03/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var CardArr = ["1","2","3","4","5","6"]
    @State var x: [CGFloat] = [0,0,0,0,0,0]
    @State var degree: [Double] = [0,0,0,0,0,0]
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            Button(action: {
                for i in 0..<self.x.count
                {
                    self.x[i] = 0
                    self.degree[i] = 0
                }
            }) {
                Image(systemName: "flame.fill").resizable().frame(width:100,height: 100).foregroundColor(.red)
            }
            ForEach(0..<6,id: \.self){ i in
                Card(img: self.CardArr[i])
                    .offset(x:self.x[i])
                    .rotationEffect(.init(degrees: self.degree[i]))
                .gesture(DragGesture()
                    .onChanged({ (value) in
                        
                         if value.translation.width > 0{
                        self.x[i] = value.translation.width
                        self.degree[i] = 15
                        }
                         else{
                            self.x[i] = value.translation.width
                            self.degree[i] = -15
                        }
                    })
                    .onEnded({ (value) in
                        if value.translation.width > 0{
                            if value.translation.width > 100{
                                self.x[i] = 500
                                self.degree[i] = 15
                            }
                            else{
                                self.x[i] = 0
                                self.degree[i] = 0
                            }
                        }
                        else{
                            if value.translation.width < -100{
                                self.x[i] = -500
                                self.degree[i] = -15
                            }
                            else{
                                self.x[i] = 0
                                self.degree[i] = 0
                            }
                        }
                    })
                )
            }.animation(.spring())
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card:View{
    var img: String = ""
    var body: some View{
        VStack{
            Image(img).resizable().frame(height: 410)
            HStack(spacing:25){
                Image(systemName: "paperplane.fill").resizable().frame(width: 25,height: 25).foregroundColor(.yellow).padding()
                Image(systemName: "gift.fill").resizable().frame(width: 25,height: 25).foregroundColor(.yellow).padding()
                Image(systemName: "tv.fill").resizable().frame(width: 25,height: 25).foregroundColor(.yellow).padding()
                Image(systemName: "wifi").resizable().frame(width: 25,height: 25).foregroundColor(.yellow).padding()
            }.background(Color.white)
            .padding(10)
            
        }
        .background(Color.white)
        .cornerRadius(25)
      
    }
}


