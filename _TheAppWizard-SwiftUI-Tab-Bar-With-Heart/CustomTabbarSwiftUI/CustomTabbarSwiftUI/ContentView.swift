import SwiftUI

struct ContentView: View {
    var body: some View {
      FinalView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FinalView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem { Label("Home" , systemImage : "house") }
            Favourite()
                .tabItem { Label("Favourite" , systemImage : "star") }
            Main()
                .tabItem { Label("Main" , systemImage : "folder") }
            Listz()
                .tabItem { Label("List" , systemImage : "list.dash") }
        }
        .accentColor(Color("Dark"))
    }
}

struct Home: View {
    @State private var heartload    = false
    @State private var heartopac    = false
    @State private var AnimView     = false
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                                    HStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 100, height: 100, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        
                                        ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 280, height: 100, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                            
                                    VStack{
                                        Rectangle()
                                            .frame(width: 200, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        Rectangle()
                                            .frame(width: 200, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                         }
                                        }
                                        
                                    }
                                    //Piece//
                                }
                                .frame(height: 80)
                                .padding(.all)
                            }
                    }
            }.offset( y : AnimView ? 0 : 900)
            .animation(Animation.easeInOut(duration: 1).delay(1.56).repeatCount(1))
                                              .onAppear(){
                                                  self.AnimView.toggle()
                                              }
            
            ZStack{
            Image("hload")
                .resizable()
                .frame(width: 200, height: 180, alignment: .center)
                .scaleEffect(heartload ? 1 : 1.3)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(10/2).repeatCount(5))
                              .onAppear() {
                                  self.heartload.toggle()
                                     }
            }.opacity(heartopac ? 0 : 1)
            .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                              .onAppear(){
                                                  self.heartopac.toggle()
                                              }
        }
    }
}

struct Favourite: View {
    @State private var heartload = false
    @State private var heartopac = false
    @State private var AnimView = false
    
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            
            GeometryReader { fullView in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<50) { index in
                                    GeometryReader { geo in
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(Color("Dark")).opacity(0.2)
                                            .frame(width: 300, height: 500, alignment: .center)
                                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                                    }
                                    .frame(width: 270)
                                    
                                }
                            }
                            .padding(.all)
                            .offset(y : 200)
                            .offset( x : AnimView ? 0 : 450)
                            .animation(Animation.easeInOut(duration: 1).delay(1.56).repeatCount(1))
                                                              .onAppear(){
                                                                  self.AnimView.toggle()
                                                              }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
            
            ZStack{
            Image("hload")
                .resizable()
                .frame(width: 200, height: 180, alignment: .center)
                .scaleEffect(heartload ? 1 : 1.3)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(10/2).repeatCount(5))
                              .onAppear() {
                                  self.heartload.toggle()
                                     }
            }.opacity(heartopac ? 0 : 1)
            .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                              .onAppear(){
                                                  self.heartopac.toggle()
                                              }
        }
    }
}

struct Main: View {
    @State private var heartload = false
    @State private var heartopac = false
    @State private var AnimView = false
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            
            GeometryReader { fullView in
                        ScrollView(.vertical) {
                            ForEach(0..<50) { index in
                                GeometryReader { geo in
                                    //Piece//
                                    HStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 100, height: 100, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        
                                        ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 280, height: 100, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                            
                                    VStack{
                                        Rectangle()
                                            .frame(width: 200, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        Rectangle()
                                            .frame(width: 200, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                         }
                                        }
                                        
                                    }
                                    //Piece//
                                }
                                .frame(height: 80)
                                .padding(.all)
                            }
                    }
                }.offset( y : AnimView ? 0 : 900)
            .animation(Animation.easeInOut(duration: 1).delay(1.56).repeatCount(1))
                                              .onAppear(){
                                                  self.AnimView.toggle()
                                              }
            ZStack{
            Image("hload")
                .resizable()
                .frame(width: 200, height: 180, alignment: .center)
                .scaleEffect(heartload ? 1 : 1.3)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(10/2).repeatCount(5))
                              .onAppear() {
                                  self.heartload.toggle()
                                     }
            }.opacity(heartopac ? 0 : 1)
            .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                              .onAppear(){
                                                  self.heartopac.toggle()
                                              }
        }
        }
    }

struct Listz: View {
    @State private var heartload = false
    @State private var heartopac = false
    @State private var AnimView = false
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            
            GeometryReader { fullView in
                        ScrollView(.vertical) {
                            ForEach(0..<50) { index in
                                GeometryReader { geo in
                                    //Piece//
                                   
                                        
                                        
                                        ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 400, height: 100, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                            
                                    VStack{
                                        Rectangle()
                                            .frame(width: 280, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        Rectangle()
                                            .frame(width: 280, height: 10, alignment: .center)
                                            .foregroundColor(Color("Dark")).opacity(0.2)
                                        
                                        
                                        }
                                        
                                    }
                                    //Piece//
                                }
                                .frame(height: 80)
                                .padding(.all)
                            }
                    }
                }.offset( y : AnimView ? 0 : 900)
                 .animation(Animation.easeInOut(duration: 1).delay(1.56).repeatCount(1))
                                              .onAppear(){
                                                  self.AnimView.toggle()
                                              }
            
            ZStack{
            Image("hload")
                .resizable()
                .frame(width: 200, height: 180, alignment: .center)
                .scaleEffect(heartload ? 1 : 1.3)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10).speed(10/2).repeatCount(5))
                              .onAppear() {
                                  self.heartload.toggle()
                                     }
            }.opacity(heartopac ? 0 : 1)
            .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                              .onAppear(){
                                                  self.heartopac.toggle()
                                              }
        }
        }
    }
