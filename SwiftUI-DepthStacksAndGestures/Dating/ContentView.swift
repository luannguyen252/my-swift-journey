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

// Home
struct Home: View {
    @State var profiles = [
        Profile(id: 0, name: "Lion", image: "p1", age: "5", offset: 0),
        Profile(id: 1, name: "Elephant", image: "p2", age: "4", offset: 0),
        Profile(id: 2, name: "Giraffe", image: "p3", age: "3", offset: 0),
        Profile(id: 3, name: "Horse", image: "p4", age: "2", offset: 0),
        Profile(id: 4, name: "Squirrel", image: "p5", age: "1", offset: 0),
        Profile(id: 5, name: "Dolphin", image: "p6", age: "4", offset: 0),
        Profile(id: 6, name: "Rabbit", image: "p7", age: "2", offset: 0),
        Profile(id: 7, name: "Wolf", image: "p8", age: "1", offset: 0),
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button(action: {
                    print("Go to Profile.")
                }, label: {
                    HStack(spacing: 8) {
                        Image(uiImage: #imageLiteral(resourceName: "profile"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                        
                        Text("Luan Nguyen")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("darkLight"))
                    }
                })
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("Go to Notification.")
                }, label: {
                    /*Image(systemName: "bell.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color("darkLight"))*/
                    Image("bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                })
            }
            .foregroundColor(.black)
            .padding()

            GeometryReader { g in
                ZStack {
                    ForEach(profiles.reversed()) { profile in
                        ProfileView(profile: profile,frame: g.frame(in: .global))
                    }
                }
            }
            .padding([.horizontal,.bottom])
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}

// Profile View
struct ProfileView: View {
    @State var profile: Profile
    var frame: CGRect

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width,height: frame.height)
           
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                (profile.offset > 0 ? Color("green") : Color("red"))
                    .opacity(profile.offset != 0 ? 0.7 : 0)
                
                HStack {
                    if profile.offset < 0 {
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
            
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(profile.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(profile.age)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                
                HStack(spacing: 40) {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = -500
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.all, 20)
                            .background(Color("red"))
                            .clipShape(Circle())
                    })
                    
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = 500
                        }
                    }, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.all, 20)
                            .background(Color("green"))
                            .clipShape(Circle())
                    })
                    
                    Spacer(minLength: 0)
                }
            }
            .padding(.all)
        })
        .cornerRadius(32)
        .offset(x: profile.offset)
        .rotationEffect(.init(degrees: profile.offset == 0 ? 0 : (profile.offset > 0 ? 12 : -12)))
        .gesture(
            DragGesture()
                .onChanged({ (value) in
                    withAnimation(.default) {
                        profile.offset = value.translation.width
                    }
                })
                .onEnded({ (value) in
                    withAnimation(.easeIn) {
                        if profile.offset > 150 {
                            profile.offset = 500
                        } else if profile.offset < -150 {
                            profile.offset = -500
                        } else {
                            profile.offset = 0
                        }
                    }
                })
        )
    }
}

struct Profile: Identifiable {
    var id: Int
    var name: String
    var image: String
    var age: String
    var offset: CGFloat
}
