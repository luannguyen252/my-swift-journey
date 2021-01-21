import SwiftUI

struct Home: View {
    // Marvel Actress Data
    @State var profiles = [
        Profile(id: 0, name: "Natalie Portman", image: "p0", age: "35", offset: 0),
        Profile(id: 1, name: "karen Gillan", image: "p1", age: "30", offset: 0),
        Profile(id: 2, name: "Hayley Atwell", image: "p2", age: "35", offset: 0),
        Profile(id: 3, name: "Zoe Saldana", image: "p3", age: "35", offset: 0),
        Profile(id: 4, name: "Elizabeth Olsen", image: "p4", age: "29", offset: 0),
        Profile(id: 5, name: "Brie Larson", image: "p5", age: "29", offset: 0),
        Profile(id: 6, name: "Gwyneth Paltrow", image: "p6", age: "35", offset: 0),
        Profile(id: 7, name: "Scarlett Johansson", image: "p7", age: "35",  offset: 0),
        Profile(id: 8, name: "Evangeline Lily", image: "p8", age: "38", offset: 0),
        Profile(id: 9, name: "Cobie Smulders", image: "p9", age: "38", offset: 0),
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button(action: {
                    print("Button Pressed!")
                }, label: {
                    Image("hamburger")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                
                Text("Marvel Date App")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("Button Pressed!")
                }, label: {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: .center)
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
    @State private var animationAmount: CGFloat = 1
    @State var profile: Profile
    var frame: CGRect
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                (profile.offset > 0 ? Color.green : Color.red).opacity(0.8)
                    .opacity(profile.offset != 0 ? 0.7 : 0)
                
                HStack {
                    if profile.offset < 0 {
                        Spacer()
                    }
                    
                    Text(profile.offset == 0 ? "" : (profile.offset > 0 ? "Selected" : "Rejected"))
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                        .padding(.horizontal)
                    
                    if profile.offset > 0 {
                        Spacer()
                    }
                }
            })
            
            LinearGradient(gradient: .init(colors: [Color.black.opacity(0),Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading,spacing: 12) {
                        Text(profile.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(profile.age + " +")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                
                HStack(spacing: 35) {
                    Spacer(minLength: 0)
                     
                    // Button Red
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = -500
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.all, 20)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                    
                    // Button Blue
                    Button(action: {
                        // self.animationAmount += 1
                      }, label: {
                        Image(systemName: "video.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.all, 20)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.blue)
                                    .scaleEffect(animationAmount)
                                    .opacity(Double(2 - animationAmount))
                                    .animation(
                                        Animation.easeInOut(duration: 1)
                                            .repeatForever(autoreverses: false)
                                    )
                            )
                      })
                    .onAppear() {
                        self.animationAmount += 2
                    }
                       
                   // Button Green
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = 500
                          }
                      }, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.all,20)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                      })
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                    
                    Spacer(minLength: 0)
                }
            }
            .padding(.all)
        })
        .cornerRadius(20)
        .offset(x: profile.offset)
        .rotationEffect(.init(degrees: profile.offset == 0 ? 0 : (profile.offset > 0 ? 12 : -12)))
        .gesture(DragGesture().onChanged({ (value) in
            withAnimation(.default) {
                profile.offset = value.translation.width
            }
        })
        .onEnded({ (value) in
            withAnimation(.easeIn) {
                // Profile Offset Conditions
                if profile.offset > 150 {
                    profile.offset = 500
                } else if profile.offset < -150 {
                    profile.offset = -500
                } else {
                    profile.offset = 0
                }
            }
        }))
    }
}
  
struct Profile: Identifiable {
    var id: Int
    var name: String
    var image: String
    var age: String
    var offset: CGFloat
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
