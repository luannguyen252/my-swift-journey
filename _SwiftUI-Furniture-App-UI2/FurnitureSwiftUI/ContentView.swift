import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// This is a Custom the TabView which includes a Home button, a Search button, a Cart button and an Account button
struct TabView: View {
    @State var index = 0
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(spacing: 0) {
                ZStack {
                    Home()
                        .opacity(self.index == 0 ? 1:0)
                    SearchView()
                        .opacity(self.index == 1 ? 1:0)
                    CartView()
                        .opacity(self.index == 2 ? 1:0)
                    AccountView()
                        .opacity(self.index == 3 ? 1:0)
                }
                .animation(.easeOut(duration: 0.5))
                
            HStack {
                // This is a Home button
                Button(action: {
                    self.index = 0
                }) {
                    HStack {
                        Image("home")
                            .resizable()
                            .foregroundColor(self.index == 0 ? .white : .primary)
                            .frame(width: 24, height: 24)
                        
                        if self.index == 0 {
                            Text("Home")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 0 ? Color("Color"): Color.clear)
                    .clipShape(Capsule())
                    .animation(.easeOut(duration: 0.5))
                }
                
                Spacer(minLength: 0)
                
                // This is a Search button
                Button(action: {
                    self.index = 1
                }) {
                    HStack {
                        Image("search").resizable()
                            .foregroundColor(self.index == 1 ? .white : .primary)
                            .frame(width: 24, height: 24)
                            
                            if self.index == 1 {
                                Text("Search")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                            }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 1 ? Color("Color"): Color.clear)
                    .clipShape(Capsule())
                    .animation(.easeOut(duration: 0.5))
                }
                
                Spacer(minLength: 0)
                
                // This is a Cart button
                Button(action: {
                    self.index = 2
                }) {
                    HStack {
                        Image("cart")
                            .resizable()
                            .foregroundColor(self.index == 2 ? .white : .primary)
                            .frame(width: 25, height: 25)
                        
                        if self.index == 2 {
                            Text("Cart")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 2 ? Color("Color"): Color.clear)
                    .clipShape(Capsule())
                    .animation(.easeIn(duration: 0.5))
                }
                Spacer(minLength: 0)
                
                // This is an Account button
                Button(action: {
                    self.index = 3
                }) {
                    HStack {
                    Image("account").resizable()
                        .foregroundColor(self.index == 3 ? .white : .primary)
                    .frame(width: 25, height: 25)
                    if self.index == 3 {
                        Text("Account")
                            .foregroundColor(.white).font(.footnote)
                    }
                }.padding(.vertical, 10)
                .padding(.horizontal)
                .background(self.index == 3 ? Color("Color"): Color.clear)
                .clipShape(Capsule())
                        .animation(.easeOut(duration: 0.5))
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal,25)
                .padding(.top)
                // based on device bottom padding will be changed...
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : UIApplication.shared.windows.first?.safeAreaInsets.bottom )
                
                .background(self.scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: 5, y: -5)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// This struct is that include a search bar and a menu...

struct Home: View{
    
    @Environment(\.colorScheme) var scheme
    @State var search = ""
    
    var body: some View {
        
        VStack{
            
            ZStack{
                HStack(spacing: 15){
                    
                    // This is a Menu button....
                    Button(action: {
                        
                    }) {
                        Image("menu").resizable()
                        .frame(width: 25, height: 25)
                        // for dark mode adoption....
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    
                    // This is a QR button...
                    Button(action: {
                        
                    }) {
                        Image("qr").resizable()
                        .frame(width: 25, height: 25)
                        // for dark mode adoption....
                            .foregroundColor(.primary)
                    }
                    
                    
                    // This is a dark and light scheme button...
                    Button(action: {
                        // changing user interface style....
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.scheme == .dark ? .light : .dark
                    }) {
                        Image(systemName: self.scheme == .dark ? "sun.max.fill" : "moon.fill")
                            .font(.system(size: 20))
                        // for dark mode aedoption....
                            .foregroundColor(.primary)
                    }
                    
                }
                
                Text("Furnitures")
                    .font(.title)
                    .fontWeight(.bold)
            }
        .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    // This is a search bar....
                        
                        HStack(spacing: 15){
                            
                            TextField("Search", text: self.$search)
                            
                            if self.search != ""{
                                
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.primary.opacity(0.05))
                    .cornerRadius(12)
                    
                    // This is an introduce of a chair...
                    
                    HStack{
                        
                        Text("Today's Pick")
                            .fontWeight(.bold)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.top, 22)
                    
                    // This is a main sample chair...
                    
                    VStack{
                        Image("loyalchair").resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.7 , height: 300)
                        Text("Loyal Chair")
                            .fontWeight(.bold)
                            .font(.title)
                        Text("$1200")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.bottom, 20)
                    }
                    .background(Color.primary.opacity(0.04).frame(width: UIScreen.main.bounds.width - 30).cornerRadius(20).padding(.top, 90))
                    .padding(.top, 20)
                    
                    // This is a recommend..
                    
                    HStack{
                        
                        Text("Favourish Chairs")
                            .fontWeight(.bold)
                            .font(.title)
                        Spacer()
                    }.padding(.top, 20)
                    
                    // This is a Grid of all furnitures...
                    
                    ForEach(furnitures,id: \.self){furniture in
                        
                        HStack(spacing: 15){
                            
                            ForEach(furniture){i in
                                VStack{
                                    
                                    Image(i.image)
                                        .resizable()
                                    .frame(width: UIScreen.main.bounds.width / 3 , height: 150)
                                    
                                    Text(i.name)
                                        .fontWeight(.bold)
                                    Text(i.price)
                                        .foregroundColor(.gray)
                                }
                            .padding()
                                .background(Color.primary.opacity(0.06))
                            .cornerRadius(10)
                            }
                        }
                        
                    }
                    
                }
            .padding()
            }
            
            Spacer()
        }
    }
}
//This is a Cart View...

struct CartView: View{
    
    var body: some View {
        
        Text("My Cart")
    }
}

// This is a Search View...

struct SearchView: View{
    
    var body: some View {
        
        Text("My Search")
    }
}

// This is an Account View...

struct AccountView: View{
    
    var body: some View {
        
        Text("My Account")
    }
}
// This is a sample data.....

struct Furniture: Identifiable, Hashable{
    
    var id: Int
    var image: String
    var name: String
    var price: String
}
// 2D array for Grid
var furnitures = [
    [Furniture(id: 0, image: "gamechair", name: "Game Chair", price: "$999"),
    Furniture(id: 1, image: "hawaiichair", name: "Garden Chair", price: "$599")],
    [Furniture(id: 2, image: "whitechair", name: "White Chair", price: "$899"),
    Furniture(id: 3, image: "blackchair", name: "Offical Chair", price: "$709")],
    [Furniture(id: 4, image: "goldchair", name: "Gold Chair", price: "$1299"),
    Furniture(id: 5, image: "pinkchair", name: "Armchair", price: "$1599")],
    [Furniture(id: 6, image: "officechair", name: "King Office Chair", price: "$699"),
    Furniture(id: 7, image: "officechair2", name: "Queen Office Chair", price: "$299")]
]
