//
//  ContentView.swift
//  Chat UI
//
//  Created by Kavsoft on 05/12/19.
//  Copyright © 2019 Kavsoft. All rights reserved.
//
// import p2 image to avoid errors....

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView{
  
            Home()
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
            
// App is crashing When tab view inside navigation View
// especially when pop up to previous controller using isActive......
            

//            TabView{
//
//                Home()
//                .navigationBarTitle("",displayMode: .inline)
//                .navigationBarHidden(true)
//                .tabItem {
//
//                    Image(systemName: "message.fill").font(.title)
//                }
//
//                Text("Person").tabItem {
//
//                    Image(systemName: "person.fill").font(.title)
//                }
//
//            }.edgesIgnoringSafeArea(.top)
//            .accentColor(Color("bg"))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        ZStack{
            
            Color("bg").edgesIgnoringSafeArea(.top)
            
            NavigationLink(destination: ChatView(), isActive: $data.show) {
            
                Text("")
            }
            VStack{
                
                topView()
            }
        }
    }
}

struct topView : View {
    
    var body : some View{
        
        VStack{
            
            HStack(spacing: 15){
                
                Text("Chats").fontWeight(.heavy).font(.system(size: 23))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "magnifyingglass").resizable().frame(width: 20, height: 20)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("menu").resizable().frame(width: 20, height: 20)
                }
                
            }
            .foregroundColor(Color.white)
            .padding()
            
            GeometryReader{_ in
                
                MainView().clipShape(Rounded())
            }
        }
        

    }
}

struct MainView : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        List(msgs){i in
            
            cellView(pic: i.pic, name: i.name, msg: i.msg, time: i.time, msgs: i.msgs).onTapGesture {
                
                self.data.selectedData = i
                self.data.show.toggle()
            }
        }
    }
}

struct cellView : View {
    
    var pic : String
    var name : String
    var msg : String
    var time : String
    var msgs : String
    
    var body : some View{
        
        HStack(spacing: 15){
            
            Image(pic).resizable().frame(width: 50, height: 50).clipShape(Circle())
            
            VStack(alignment:.leading,spacing: 5){
                
                Text(name)
                Text(msg).lineLimit(2)
            }
            
            Spacer()
            
            VStack(spacing: 10){
                
                Text(time)
                if msgs != ""{
                    
                    Text(msgs).padding(8).background(Color("bg")).foregroundColor(.white).clipShape(Circle())
                }
                else{
                    
                    Spacer()
                }
            }
            
        }.padding(9)
    }
}

struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
}


struct msgType : Identifiable {
    
    var id : Int
    var msg : String
    var time : String
    var msgs : String
    var name : String
    var pic : String
}

// I already made a sample data....

var msgs : [msgType] = [
    
    msgType(id: 0, msg: "New Album Is Going To Be Released!!!!", time: "14:32", msgs: "2", name: "Taylor", pic: "p0")
    ,msgType(id: 1, msg: "Hi this is Steve Rogers !!!", time: "14:35", msgs: "2", name: "Steve", pic: "p1")
    ,msgType(id: 2, msg: "New Tutorial From Kavosft !!!", time: "14:39", msgs: "1", name: "Kavsoft", pic: "p2")
    ,msgType(id: 3, msg: "New SwiftUI API Is Released!!!!", time: "14:50", msgs: "", name: "SwiftUI", pic: "p3")
    ,msgType(id: 4, msg: "Free Publicity For Apple Products!!!", time: "15:00", msgs: "", name: "Justine", pic: "p4"),
     msgType(id: 5, msg: "Founder Of Microsoft !!!", time: "14:50", msgs: "", name: "Bill Gates", pic: "p5"),
     msgType(id: 6, msg: "Founder Of Amazon", time: "14:39", msgs: "1", name: "Jeff", pic: "p6"),
     msgType(id: 7, msg: "Released New iPhone 11!!!", time: "14:32", msgs: "2", name: "Tim Cook", pic: "p7")
     
     
]


// chat view starts from here.....

struct ChatView : View {
    var body : some View{
        
        ZStack{
            
            Color("bg").edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0){
                
                chatTopview()
                GeometryReader{_ in
                    
                    chatList()
                }
                
                chatBottomView()
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct chatTopview : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        
        HStack(spacing : 15){
            
            Button(action: {
                
                self.data.show.toggle()
                
            }) {
                
                Image(systemName: "control").font(.title).rotationEffect(.init(degrees: -90))
            }
            
            Spacer()
            
            VStack(spacing: 5){
                
                Image(data.selectedData.pic).resizable().frame(width: 45, height: 45).clipShape(Circle())
                
                Text(data.selectedData.name).fontWeight(.heavy)
                
            }.offset(x: 25)
            
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image(systemName: "phone.fill").resizable().frame(width: 20, height: 20)
                
            }.padding(.trailing, 25)
            
            Button(action: {
                
            }) {
                
                Image(systemName: "video.fill").resizable().frame(width: 23, height: 16)
            }
            
            }.foregroundColor(.white)
            .padding()
    }
}

struct chatBottomView : View {
    
    @State var txt = ""
    
    var body : some View{
        
        
        HStack{
            
            HStack(spacing : 8){
                      
                      Button(action: {
                          
                      }) {
                          
                          Image("emoji").resizable().frame(width: 20, height: 20)
                          
                      }.foregroundColor(.gray)
                      
                      TextField("Type Something", text: $txt)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "camera.fill").font(.body)
                          
                      }.foregroundColor(.gray)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "paperclip").font(.body)
                          
                      }.foregroundColor(.gray)
                      
                  }.padding()
                  .background(Color("Color"))
                  .clipShape(Capsule())
            
            Button(action: {
                
            }) {
                
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 15, height: 23)
                    .padding(13)
                    .foregroundColor(.white)
                    .background(Color("bg"))
                    .clipShape(Circle())
                
            }.foregroundColor(.gray)
            
        }.padding(.horizontal, 15)
        .background(Color.white)
      
    }
}

struct chatList : View {
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ForEach(Eachmsg){i in
                    
                    chatCell(data: i)
                }
            }
            
        }.padding(.horizontal, 15)
        .background(Color.white)
        .clipShape(Rounded())

    }
}

struct chatCell : View {
    
    var data : msgdataType
    
    var body : some View{
        
        HStack{
            
            if data.myMsg{
                
                Spacer()
                
                Text(data.msg)
                    .padding()
                    .background(Color("bg"))
                    .clipShape(msgTail(mymsg: data.myMsg))
                    .foregroundColor(.white)
            }
            else{
                
                Text(data.msg)
                    .padding()
                    .background(Color("txtbox"))
                    .clipShape(msgTail(mymsg: data.myMsg))
                
                Spacer()
            }
            
        }.padding(data.myMsg ? .leading : .trailing, 55)
        .padding(.vertical,10)
    }
}


struct msgTail : Shape {
    
    var mymsg : Bool
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}


struct msgdataType : Identifiable {
    
    var id : Int
    var msg : String
    var myMsg : Bool
}

// i have already implemented a sample data model.....

var Eachmsg = [
    
    msgdataType(id: 0, msg: "New Album Is Going To Be Released!!!!", myMsg: false),
    
    msgdataType(id: 1, msg: "Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple TV, plus explore accessories, entertainment!!!", myMsg: false),
    
    msgdataType(id: 2, msg: "Amazon.in: Online Shopping India - Buy mobiles, laptops, cameras, books, watches, apparel, shoes and e-Gift Cards.", myMsg: false),
    
    msgdataType(id: 3, msg: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.", myMsg: true),
    
    msgdataType(id: 4, msg: "At Microsoft our mission and values are to help people and businesses throughout the world realize their full potential.!!!!", myMsg: false),
    
    msgdataType(id: 5, msg: "Firebase is Google's mobile platform that helps you quickly develop high-quality apps and grow your business.", myMsg: true),
    
    msgdataType(id: 6, msg: "Kavsoft - SwiftUI Tutorials - Easier Way To Learn SwiftUI With Downloadble Source Code.!!!!", myMsg: true)


]


class msgDatas : ObservableObject{
    
    @Published var show : Bool = false
    @Published var selectedData : msgType = .init(id: -1, msg: "", time: "", msgs: "", name: "", pic: "")
}



// tab view inside a navigation view is crashing without any reason...
// seems to be xcode bug.....
// its working without tab view seems to be bug....
