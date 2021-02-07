//
//  ContentView.swift
//  Heyo
//
//  Created by Daval Cato on 6/28/20.
//  Copyright © 2020 Daval Cato. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            TabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabView : View {
    
    @State var index = 0
    @Environment(\.colorScheme) var scheme
    var colors = [Color("Color"),Color("Color1")]
    
    var body: some View{
        
        // tabview with navigation bar...
        
        ZStack(alignment: .bottom) {
            
            // changing view based on index...
            
            if self.index == 0{
                
                Home()
            }
            else if self.index == 1{
                
                Search()
                // hiding navigation bar for all other remaining tabs..
                .navigationBarHidden(true)
            }
            else if self.index == 2{
                
                Notifications()
                .navigationBarHidden(true)
            }
            else{
                
                Profile()
                .navigationBarHidden(true)
            }
            
            // TabView..
            
            ZStack(alignment: .top) {
                
                HStack(spacing: 0){
                    
                    Button(action: {
                        
                        self.index = 0
                        
                    }) {
                        
                        Image("home")
                            .foregroundColor(self.index == 0 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }
                    .padding(.trailing, 30)
                    
                    Button(action: {
                        
                        self.index = 1
                        
                    }) {
                        
                        Image("search")
                            .foregroundColor(self.index == 1 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }

                    // for center space...
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.index = 2
                        
                    }) {
                        
                        Image(systemName: "suit.heart.fill")
                            .font(.system(size: 24))
                            .foregroundColor(self.index == 2 ? Color.primary : Color.primary.opacity(0.25))
                            .padding(.horizontal)
                    }
                    .padding(.trailing, 30)

                    
                    Button(action: {
                        
                        self.index = 3
                        
                    }) {
                        
                        Image("profile")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                        .padding(.horizontal)
                    }

                }
                .padding(.horizontal)
                .padding(.top)
                // because bottom edge is ignored...
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(self.scheme == .dark ? Color.black : Color.white)
                .clipShape(CShape())
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: -5)
                
                // Button
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                        .background(LinearGradient(gradient: .init(colors: self.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(Circle())
                        .shadow(radius: 1)
                }
                // Moving View Up..
                .offset(y: -24)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Search : View {
    
    var body: some View{
        
        // to occupie available remaining spaces..
        
        GeometryReader{_ in
        
            VStack{
                
                Text("Search")
            }
            
        }
    }
}

struct Notifications : View {
    
    var body: some View{
        
        // to occupie available remaining spaces..
        
        GeometryReader{_ in
        
            VStack{
                
                Text("Notifications")
            }
            
        }
    }
}

struct Profile : View {
    
    var body: some View{
        
        // to occupie available remaining spaces..
        
        GeometryReader{_ in
        
            VStack{
                
                Text("Profile")
            }
            
        }
    }
}

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        // center curve...
        
        return Path{path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            // center curve..
            
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}

struct Home : View {
    
    
    var colors = [Color("Color"),Color("Color1")]
    // to identify dark mode...
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 15){
                        
//<<<<<<< Updated upstream
//=======
//                        Button(action: {
//                            
//                           
//                            
//                        }) {
//                      
//>>>>>>> Stashed changes
                        ZStack(alignment: .bottomTrailing){
                            
                            Image("p1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 18))
                                // for dark mode adoption...
                                .foregroundColor(.primary)
                        }
                        
                        ForEach(2...8,id: \.self){i in
                            
                            ZStack{
                                
                                Image("p\(i)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                
                                // Ring...
                                
                                Circle()
                                    
                                    .trim(from: 0, to: 1)
                                   
                                    .stroke(AngularGradient(gradient: .init(colors: self.colors), center: .center), lineWidth: 3)
                                    .frame(width: 68, height: 68)
                            }
                        }
                    }
                    .padding()
                }
                .background(self.scheme == .dark ? Color.black : Color.white)
                // shadow...
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: 5)
                
                // PostView...
                
                ForEach(data){i in
                    
                    PostView(postData: i)
                }
            }
            .padding(.bottom, 110)
            
            // since tab view is used inside Zstack...
        }
        .navigationBarTitle("Heyo",displayMode: .inline)
        .navigationBarItems(leading:
            
            Button(action: {
                
            }, label: {
                
                Image("camera")
                    .foregroundColor(.gray)
            })
            , trailing:
        
            NavigationLink(destination: Text("Send Message"), label: {
                
                Image("send")
                    .foregroundColor(.gray)
            })
        )
    }
}

struct PostView : View {
    
    var postData : Post
    @State var comment = ""
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            HStack(spacing: 12){
                
                Image(self.postData.profile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(self.postData.user)
                    
                    Text(self.postData.time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    
                    Image("menu")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.gray)
                }
            }
            
            Image(self.postData.postImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 280)
                .cornerRadius(10)
                .padding(.vertical, 10)
            
            HStack(spacing: 20){
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 24))
                        .foregroundColor(self.postData.liked ? .red : .gray)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("send")
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    
                    Image("save")
                    .resizable()
                    .frame(width: 18, height: 22)
                    .foregroundColor(.gray)
                }
            }
            
            Text(self.postData.likes + " likes")
            
            Text(self.postData.postTitle)
                .padding(.top, 5)
            
            Button(action: {
                
            }) {
                
                Text("View all 133 comments")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
            
            HStack(spacing: 15){
                
                TextField("Add a comment", text: self.$comment)
                    .font(.system(size: 12))
                
                Button(action: {
                    
                    
                }) {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            .padding(.vertical,6)
            .background(Capsule().stroke(Color.gray, lineWidth: 1))
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

// Post Data..

struct Post : Identifiable {
    
    var id : Int
    var user : String
    var profile: String
    var postImage : String
    var postTitle : String
    var time : String
    var likes : String
    var liked : Bool
    
    var loading : Bool
    var seen : Bool
    
    
}

var data = [

    Post(id: 0, user: "Capcom", profile: "p1", postImage: "post1", postTitle: "New Resident Evil Village...", time: "24 min ago", likes: "1525", liked: true, loading: false, seen: false),
    
    Post(id: 1, user: "iJustine", profile: "profile", postImage: "post2", postTitle: "iPhone 11.....", time: "58 min ago", likes: "2562", liked: true, loading: false, seen: false),
    
    Post(id: 2, user: "Apple", profile: "p2", postImage: "post3", postTitle: "WWDC 2020 @ June 22", time: "1 hr ago", likes: "24568", liked: false, loading: false, seen: false),
    
    Post(id: 3, user: "Catherine", profile: "p4", postImage: "post4", postTitle: "Nice Day :)", time: "28 min ago", likes: "1925", liked: false, loading: false, seen: false),
    
    Post(id: 4, user: "UnBoxing", profile: "p5", postImage: "post5", postTitle: "New MacBook Pro Unbox...", time: "2 min ago", likes: "85669", liked: false, loading: false, seen: false)
]
