//
//  ContentView.swift
//  Apple Music Header
//
//  Created by Balaji on 26/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var opacity : Double = 0
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    // First Parallax Scroll...
                    
                    GeometryReader{reader in
                        
                        VStack{
                            
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                // default widht...
                                .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + (UIScreen.main.bounds.height / 2.2) : UIScreen.main.bounds.height / 2.2)
                            // adjusting view postion when scrolls...
                                .offset(y: -reader.frame(in: .global).minY)
                            
                            // NavBar Change....
                                .onChange(of: reader.frame(in: .global).minY){value in
                                    
                                    // Checking if top is reached...
                                    
                                    let offset = value + (UIScreen.main.bounds.height / 2.2)
                                    
                                    if offset < 80{
                                        
                                        // ranging from 0 - 80...
                                        
                                        if offset > 0{
                                            
                                            // calcluating opacity....
                                            
                                            let opacity_value = (80 - offset) / 80
                                            
                                            self.opacity = Double(opacity_value)
                                            
                                            return
                                        }
                                        
                                        // else means full opactiy..
                                        
                                        self.opacity = 1
                                    }
                                    else{
                                        
                                        self.opacity = 0
                                    }
                                }
                        }
                    }
                    // setting default height...
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    // List Of Songs...
                    
                    VStack(spacing: 10){
                        
                        ForEach(albums,id: \.album_name){album in
                            
                            HStack(spacing: 15){
                                
                                Image("\(album.album_cover)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(15)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("\(album.album_name)")
                                    
                                    Text("\(album.album_author)")
                                        .font(.caption)
                                }
                                
                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    .background(Color.white)
                }
            }
            
            HStack{
                
                Button(action: {}) {
                    
                    HStack(spacing: 8){
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Search")
                            .fontWeight(.semibold)
                    }
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 22, height: 22)
                        .rotationEffect(.init(degrees: 90))
                }
            }
            .padding()
            .foregroundColor(opacity > 0.6 ? .black : .white)
            // since top edge is ignored...
            .padding(.top,edges!.top)
            .background(Color.white.opacity(opacity))
            .shadow(color: Color.black.opacity(opacity > 0.8 ? 0.1 : 0), radius: 5, x: 0, y: 5)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// Sample Data...

struct Album{

    var album_name : String
    var album_author : String
    var album_cover : String
}

var albums = [

    //Album(album_name: "Let Her Go", album_author: "Passenger", album_cover: "p1"),
    Album(album_name: "Bad Blood", album_author: "Taylor Swift", album_cover: "p2"),
    Album(album_name: "Believer", album_author: "Kurt Hugo Schneider", album_cover: "p3"),
    Album(album_name: "Let Me Love You", album_author: "DJ Snake", album_cover: "p4"),
    Album(album_name: "Shape Of You", album_author: "Ed Sherran", album_cover: "p5"),
    Album(album_name: "Blank Space", album_author: "Taylor Swift", album_cover: "p6"),
    Album(album_name: "Havana", album_author: "Camila Cabello", album_cover: "p7"),
    Album(album_name: "Red", album_author: "Taylor Swift", album_cover: "p8"),
    Album(album_name: "I Like It", album_author: "J Balvin", album_cover: "p9"),
    Album(album_name: "Lover", album_author: "Taylor Swift", album_cover: "p10"),
    Album(album_name: "7/27 Harmony", album_author: "Camila Cabello", album_cover: "p11"),
    Album(album_name: "Joanne", album_author: "Lady Gaga", album_cover: "p12"),
    Album(album_name: "Roar", album_author: "Kay Perry", album_cover: "p13"),
    Album(album_name: "My Church", album_author: "Maren Morris", album_cover: "p14"),
    Album(album_name: "Part Of Me", album_author: "Katy Perry", album_cover: "p15"),
]
