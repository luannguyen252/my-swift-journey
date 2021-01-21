import SwiftUI

struct ContentView: View {
       var hero = heroData
       @State var showContent = false
    
       var body: some View {
        ZStack {
            Image("spiderback")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Image("mar")
                            .resizable()
                            .frame(width: 150, height: 60, alignment: .center)
                            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                            .opacity(0.8)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30.0) {
                            ForEach(hero) { item in
                                Button(action: { self.showContent.toggle() }) {
                                    GeometryReader { geometry in
                                        HeroView(title: item.title, image: item.image, color: item.color, shadowColor: item.shadowColor)
                                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                            .sheet(isPresented: self.$showContent) {
                                                SpiderView()
                                            }
                                    }
                                    .frame(width: 246, height: 360)
                                }
                            }
                        }
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .padding(.bottom, 70)
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ZStack {
                                Image("cap")
                                    .resizable()
                                    .frame(width: 250, height: 150, alignment: .center)
                                    .cornerRadius(25)
                                    .opacity(0.8)
                            
                                VStack {
                                    Text("CAPTAIN AMERICA")
                                        .font(.title2)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white).opacity(0.8)
                                }
                            }
                            
                            ZStack {
                                Image("ave")
                                    .resizable()
                                    .frame(width: 250, height: 150, alignment: .center)
                                    .cornerRadius(25)
                                    .opacity(0.8)
                            
                                VStack {
                                    Text("THE AVENGERS")
                                        .font(.title2)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white).opacity(0.8)
                                }
                            }
                            
                            ZStack {
                                Image("ir")
                                    .resizable()
                                    .frame(width: 250, height: 150, alignment: .center)
                                    .cornerRadius(25)
                                    .opacity(0.8)
                            
                                VStack {
                                    Text("IRON MAN 2")
                                        .font(.title2)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white).opacity(0.8)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 78)
            }
        }
    }
}

// Hero View
struct HeroView: View {
    var title = "Example SwiftUI"
    var image = "spiderman"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
            
            Spacer()
            
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.bottom, 30)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

// Hero Data Model
struct Hero: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

// Hero Data
let heroData = [
    Hero(title: "SPIDERMAN", image: "spiderman", color: Color.red.opacity(1), shadowColor: Color("backgroundShadow3")),
    Hero(title: "BLACKWIDOW", image: "blackwi", color: Color("background4"), shadowColor: Color("backgroundShadow4")),
    Hero(title: "IRONMAN", image: "ironman", color: Color.yellow, shadowColor: Color("shadowyel")),
    Hero(title: "CAPTAIN AMERICA", image: "captain", color: Color("background8"), shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Hero(title: "HULK", image: "hulk", color: Color.green.opacity(0.8), shadowColor: Color("shadowgr")),
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
