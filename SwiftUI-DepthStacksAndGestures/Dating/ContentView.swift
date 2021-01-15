//
//  DatingApp.swift
//  Dating
//
//  Created by Balaji on 30/06/20.
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
    
    @State var profiles = [
        
        Profile(id: 0, name: "Annie Watson", image: "p0", age: "27", offset: 0),
        Profile(id: 1, name: "Clarie", image: "p1", age: "19", offset: 0),
        Profile(id: 2, name: "Catherine", image: "p2", age: "25", offset: 0),
        Profile(id: 3, name: "Emma", image: "p3", age: "26", offset: 0),
        Profile(id: 4, name: "Juliana", image: "p4", age: "20", offset: 0),
        Profile(id: 5, name: "Kaviya", image: "p5", age: "22", offset: 0),
        Profile(id: 6, name: "Jill", image: "p6", age: "18", offset: 0),
        Profile(id: 7, name: "Terasa", image: "p7", age: "29", offset: 0),
    ]
    
    var body: some View{
        
        VStack{
            
            HStack(spacing: 15){
                
                Button(action: {}, label: {
                    
                    Image("menu")
                        .renderingMode(.template)
                })
                
                Text("Blind Dating")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    
                    Image("noti")
                        .renderingMode(.template)
                })
            }
            .foregroundColor(.black)
            .padding()

            GeometryReader{g in
                
                ZStack{
                    
                    ForEach(profiles.reversed()){profile in
                        
                        ProfileView(profile: profile,frame: g.frame(in: .global))
                    }
                }
            }
            .padding([.horizontal,.bottom])
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}


struct ProfileView : View {
    
    @State var profile : Profile
    var frame : CGRect
    
    var body: some View{

        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width,height: frame.height)
           
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                
                (profile.offset > 0 ? Color.green : Color("Color"))
                    .opacity(profile.offset != 0 ? 0.7 : 0)
                
                HStack{
                    
                    if profile.offset < 0{
                        
                        Spacer()
                    }
                    
                    Text(profile.offset == 0 ? "" : (profile.offset > 0 ? "Liked" : "Rejected"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                        .padding(.horizontal)
                    
                    if profile.offset > 0 {
                        
                        Spacer()
                    }
                }
            })

            LinearGradient(gradient: .init(colors: [Color.black.opacity(0),Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            
            VStack(spacing: 20){
                
                HStack{
                    
                    VStack(alignment: .leading,spacing: 12){
                        
                        Text(profile.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(profile.age + " +")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                
                HStack(spacing: 35){
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            profile.offset = -500
                        }
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.all,20)
                            .background(Color("Color"))
                            .clipShape(Circle())
                    })
                    
                    Button(action: {
                        
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            profile.offset = 500
                        }
                        
                    }, label: {
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.all,20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    
                    Spacer(minLength: 0)
                }
            }
            .padding(.all)
        })
        .cornerRadius(20)
        .offset(x: profile.offset)
        .rotationEffect(.init(degrees: profile.offset == 0 ? 0 : (profile.offset > 0 ? 12 : -12)))
        .gesture(
        
            DragGesture()
                .onChanged({ (value) in
                    
                    withAnimation(.default){
                    
                        profile.offset = value.translation.width
                    }
                })
                .onEnded({ (value) in
                    
                    withAnimation(.easeIn){
                    
                        if profile.offset > 150{
                            
                            profile.offset = 500
                        }
                        else if profile.offset < -150{
                            
                            profile.offset = -500
                        }
                        else{
                            
                            profile.offset = 0
                        }
                    }
                })
        )
    }
}

struct Profile : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var age : String
    var offset : CGFloat
}
