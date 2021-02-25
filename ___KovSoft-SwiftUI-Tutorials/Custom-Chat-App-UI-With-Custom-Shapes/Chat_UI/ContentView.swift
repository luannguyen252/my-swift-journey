//
//  ContentView.swift
//  Chat_UI
//
//  Created by Balaji on 29/08/20.
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
    @State var selectedTab = "Chats"
    @Namespace var animation
    
    var body: some View{
        
        VStack(spacing: 0){
            
            VStack{
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "camera")
                                .font(.system(size: 22))
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                        })
                    }
                    
                    Text("ModyChat")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top,edges!.top)
                .foregroundColor(.white)
                
                
                HStack(spacing: 20){
                    
                    ForEach(tabs,id: \.self){title in
                        
                        TabButton(selectedTab: $selectedTab, title: title, animation: animation)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(15)
                .padding(.vertical)
            }
            .padding(.bottom)
            .background(Color("top"))
            .clipShape(CustomCorner(corner: .bottomLeft, size: 65))
            
            ZStack{
                
                Color("top")
                
                Color("bg")
                    .clipShape(CustomCorner(corner: .topRight, size: 65))
                 
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(spacing: 20){
                        
                        HStack{
                            
                            Text("All Chats")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {}, label: {
                                
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                            })
                        }
                        .padding([.horizontal,.top])
                        
                        ForEach(data,id: \.groupName){gData in
                            
                            // Group Name..
                            HStack{
                                
                                Text(gData.groupName)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)
                            
                            // Group Data....
                            
                            ForEach(gData.groupData){chatData in
                                
                                // Chat View...
                                
                                ChatView(chatData: chatData)
                            }
                        }
                    }
                    .padding(.vertical)
                    
                })
                //.clipShape(CustomCorner(corner: .topRight, size: 65))
                // its cutting off inside view may be its a bug....
            }
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}

var tabs = ["Chats","Status","Calls"]

struct TabButton : View {
    
    @Binding var selectedTab : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            withAnimation{
                
                selectedTab = title
            }
            
        }, label: {
            
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal)
                // Sliding Effect...
                .background(
                
                    ZStack{
                        
                        if selectedTab == title{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("top"))
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
}

struct CustomCorner : Shape {
    
    var corner : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

struct ChatView : View {
    
    var chatData : Chat
    
    var body: some View{
        
        HStack(spacing: 10){
            
            Image(chatData.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(chatData.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                Text(chatData.msg)
                    .font(.caption)
                    .lineLimit(1)
            })
            
            Spacer(minLength: 0)
            
            Text(chatData.time)
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}

// Model And Sample Data....

struct Chat : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var image : String
    var msg : String
    var time : String
}

// were going to do custom grouping of views....

struct HomeData {
    
    var groupName : String
    var groupData : [Chat]
}

var FriendsChat : [Chat] = [

    Chat(name: "iJustine",image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft",image: "p1", msg: "Learn - Develop - Deploy", time: "03:45"),
    Chat(name: "SwiftUI",image: "p2", msg: "New Framework For iOS", time: "04:55"),
    Chat(name: "Bill Gates",image: "p3", msg: "Founder Of Microsoft", time: "06:25"),
    Chat(name: "Tim Cook",image: "p4", msg: "Apple lnc CEO", time: "07:19"),
    Chat(name: "Jeff",image: "p5", msg: "I dont Know How To Spend Money :)))", time: "08:22"),
]

var GroupChat : [Chat] = [

    Chat(name: "iTeam",image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft - Developers",image: "p1", msg: "Next Video :))))", time: "03:45"),
    Chat(name: "SwiftUI - Community",image: "p2", msg: "New File Importer/Exporter", time: "04:55"),
]

var data = [

    // Group 1
    HomeData(groupName: "Friends", groupData: FriendsChat),
    // Group 2
    HomeData(groupName: "Group Message", groupData: GroupChat)
]
