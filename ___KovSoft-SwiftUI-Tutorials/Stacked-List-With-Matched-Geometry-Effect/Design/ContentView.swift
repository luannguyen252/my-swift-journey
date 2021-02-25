//
//  ContentView.swift
//  Design
//
//  Created by Balaji on 24/07/20.
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
    
    @State var design_tools = [
        
        Tools(id: 0, image: "sketch", name: "Sketch", offset: 0,place: 1),
        Tools(id: 1, image: "figma", name: "Figma", offset: 0,place: 2),
        Tools(id: 2, image: "xd", name: "XD", offset: 0,place: 3),
        Tools(id: 3, image: "ilustrator", name: "Ilustrator", offset: 0,place: 4),
        Tools(id: 4, image: "ps", name: "Photoshop", offset: 0,place: 5),
        Tools(id: 5, image: "invison", name: "Invision", offset: 0,place: 6),
        Tools(id: 6, image: "affinity", name: "Affinity Photos", offset: 0,place: 7),
    
    ]
    
    // to track which card is swiped...
    @State var swiped = 0
    @Namespace var name
    @State var selected : Tools =  Tools(id: 0, image: "sketch", name: "Sketch", offset: 0,place: 1)
    @State var show = false
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Products")
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 12){
                            
                            Text("Design tools")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white.opacity(0.7))
                            
                            Button(action: {}) {
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("orange"))
                            }
                        }
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding()
                
                // Stacked Elements....
                
                GeometryReader{reader in
                    
                    ZStack{
                        
                        // Zstack will overlay on one another so revesing...
                        
                        ForEach(design_tools.reversed()){tool in
                            
                            CardView(tool: tool, reader: reader, swiped: $swiped,show: $show,selected: $selected,name: name)
                            // adding gesture...
                                .offset(x: tool.offset)
                                .rotationEffect(.init(degrees: getRotation(offset: tool.offset)))
                                .gesture(DragGesture().onChanged({ (value) in
                                    
                                    // updating postion...
                                    
                                    withAnimation{
                                        
                                        // only left swipe..
                                        
                                        if value.translation.width > 0{
                                            
                                            design_tools[tool.id].offset = value.translation.width
                                        }
                                    }
                                    
                                }).onEnded({ (value) in
                                    
                                    withAnimation{
                                        
                                        if value.translation.width > 150{
                                            
                                            design_tools[tool.id].offset = 1000
                                            
                                            // updating Swipe id
                                            
                                            // since its starting from 0....
                                            
                                            swiped = tool.id + 1
                                            
                                            restoreCard(id: tool.id)
                                        }
                                        else{
                                            
                                            design_tools[tool.id].offset = 0
                                        }
                                    }
                                    
                                }))
                        }
                    }
                    .offset(y: -25)
                }
                
            }
            
            if show{
                
                Detail(tool: selected, show: $show, name: name)
            }
        }
        .background(
        
            LinearGradient(gradient: .init(colors: [Color("top"),Color("center"),Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            // disabling bg color when its expanded...
                .opacity(show ? 0 : 1)
        )
    }
    
    // adding card to last...
    
    func restoreCard(id: Int){
        
        var currentCard = design_tools[id]
        
        // appending last..
        
        currentCard.id = design_tools.count
        
        design_tools.append(currentCard)
        
        // Going Back Effect...
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation{
                
                // last one we appended..'
                
                design_tools[design_tools.count - 1].offset = 0
            }
        }
    }

    // rotation...
    
    func getRotation(offset: CGFloat)->Double{
        
        let value = offset / 150
        
        // you can give your own angle here...
        
        let angle : CGFloat = 5
        
        let degree = Double(value * angle)
        
        return degree
    }
}

struct CardView : View {
    
    var tool : Tools
    var reader : GeometryProxy
    @Binding var swiped : Int
    @Binding var show : Bool
    @Binding var selected : Tools
    var name : Namespace.ID
    
    var body: some View{
        
        VStack{
            
            Spacer(minLength: 0)
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                
                VStack{
                    
                    Image("\(tool.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: tool.image, in: name)
                        .padding(.top)
                        .padding(.horizontal,25)
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("\(tool.name)")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Design tool")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                            
                            Button(action: {
                                
                                withAnimation(.spring()){
                                    
                                    selected = tool
                                    show.toggle()
                                }
                                
                            }) {
                                
                                Text("Know More >")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("orange"))
                            }
                            .padding(.top)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,15)
                    .padding(.top,25)
                }
                
                HStack{
                    
                    Text("#")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))
                    
                    Text("\(tool.place)")
                        .font(.system(size: UIScreen.main.bounds.height < 750 ? 100 : 120))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))
                }
                .offset(x: -15, y: UIScreen.main.bounds.height < 750 ? 5 : 25)
            })
            // setting dynamic frame....
            .frame(height: reader.frame(in: .global).height - 120)
            .padding(.vertical,10)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal,30 + (CGFloat(tool.id - swiped) * 10))
            .offset(y: tool.id - swiped <= 2 ? CGFloat(tool.id - swiped) * 25 : 50)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 5)
            
            Spacer(minLength: 0)
        }
        // content Shape...
        // for drag gesture...
        .contentShape(Rectangle())
    }
}

// Sample Data....

struct Tools : Identifiable {
    
    var id : Int
    var image : String
    var name : String
    var offset : CGFloat
    var place : Int
}

// Detail View...

struct Detail : View {
    
    var tool : Tools
    @Binding var show : Bool
    var name : Namespace.ID
    
    var body: some View{
        
        VStack{
            
            HStack(alignment: .top, spacing: 12) {
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
                
                Spacer(minLength: 0)
                
                Image(tool.image)
                    .matchedGeometryEffect(id: tool.image, in: name)
            }
            .padding(.leading,20)
            .padding([.top,.bottom,.trailing])
            
            // for smaller size phones..
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(tool.name)
                                .font(.system(size: 45, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text("Design tools")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                            
                            Text("Free")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.top,10)
                        }
                        
                        Spacer(minLength: 10)
                        
                        HStack{
                            
                            Text("#")
                                .font(.system(size: 60, weight: .bold))
                                
                            Text("\(tool.place)")
                                .font(.system(size: UIScreen.main.bounds.height < 750 ? 150 : 180, weight: .bold))
                        }
                        .foregroundColor(Color.gray.opacity(0.7))
                    }
                    .padding(.vertical)

                    
                    Text("\(tool.name) is a vector graphics editor and prototyping tool. It is primarily web-based, with additional offline features enabled by desktop applications for macOS and Windows.")
                        .font(.system(size: 22))
                        .foregroundColor(Color.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    
                    HStack(spacing: 15){
                        
                        Button(action: {}) {
                            
                            Text("Website")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                                .background(Color("orange"))
                                .clipShape(Capsule())
                        }
                        
                        Button(action: {}) {
                            
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(Color("orange"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                    }
                    .padding(.top,25)
                    .padding(.bottom)
                }
                .padding(.horizontal,20)
            }
        }
        .background(Color.white)
    }
}
