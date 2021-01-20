import SwiftUI

struct Home: View {
    @State var index = 0
    @State var show = false
    
    var body: some View {
        ZStack {
            // Main Menu
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("avatar")
                        .resizable()
                        .cornerRadius(30)
                        .frame(width: 70, height: 70, alignment: .center)
                    Text("Hey,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Shreyas")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Button(action: {
                        self.index = 0
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image("catalouge")
                                .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                            Text("Home")
                                .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top,25)
                    Button(action: {
                        self.index = 1
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25){
                            Image(systemName: "play.fill")
                                .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                            Text("Playlists")
                                .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        self.index = 2
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                            Text("Favourites")
                                .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        self.index = 3
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image("settings")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                            Text("Settings")
                                .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    Button(action: { print("Button Pressed!") }) {
                        HStack(spacing: 25) {
                            Image(systemName:"action")
                                .foregroundColor(Color.white)
                            Text("Sign Out")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top,25)
                .padding(.horizontal,20)
                Spacer(minLength: 0)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)

            // MainView
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        // Close Button
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }

                    // Changing Name Based On Index
                    Text(self.index == 0 ? "Home" :
                            (self.index == 1 ? "Playlists" :
                                (self.index == 2 ? "Favourites" : "Settings")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader { _ in
                    VStack {
                        // Changing Views Based On Index
                        if self.index == 0 {
                            MainPage()
                        }
                        else if self.index == 1 {
                            Queue()
                        }
                        else if self.index == 2 {
                           Favourites()
                        }
                        else {
                          Playlists()
                        }
                    }
                }
            }
            .background(Color.white)
            // Applying Corner Radius
            .cornerRadius(self.show ? 30 : 0)
            // Shrinking And Moving View Right Side When Menu Button Is Clicked
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            // Rotating Slighlty
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
