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
    // For Sticky Header View
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top, content: {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    // Now going to do strechy header
                    GeometryReader { g in
                        Image("poster")
                            .resizable()
                            // Fixing the view to the top will give strechy effect
                            // Increasing height by drag amount
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                            .onReceive(self.time) { (_) in
                        
                            // Its not a timer for tracking the image is scrolled out or not
                            let y = g.frame(in: .global).minY
                            
                            if -y > (UIScreen.main.bounds.height / 2.2) - 50 {
                                withAnimation {
                                    self.show = true
                                }
                            } else {
                                withAnimation {
                                    self.show = false
                                }
                            }
                        }
                    }
                    // Fixing default height
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack {
                        HStack {
                            Text("New Games We Love")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                print("See All Pressed.")
                            }) {
                                Text("See All")
                                    .fontWeight(.bold)
                            }
                        }
                        
                        VStack(spacing: 16) {
                            ForEach(data) { i in
                                CardView(data: i)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()

                    Spacer()
                }
            })
            
            if self.show {
                TopView()
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}

// Card View
struct CardView: View {
    var data: Card
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(self.data.image)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(self.data.title)
                    .fontWeight(.bold)
                
                Text(self.data.subTitile)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 16) {
                    Button(action: {
                        print("Get Pressed.")
                    }) {
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            // For adapting to dark mode
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    
                    Text("In-App\nPurchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
    }
}

// Top View
struct TopView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    Image("apple")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        // For dark mode adaption
                        .foregroundColor(.primary)
                    
                    Text("Arcade")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("One Month free, then $4.99/month.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                print("Try It Free Pressed.")
            }) {
                Text("Try It Free")
                    .foregroundColor(.white)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        // For non safe area phones padding will be 16
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 16 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}

// Blur Background
struct BlurBG: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        // For dark mode adoption
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

// Card Data Model
struct Card: Identifiable {
    var id: Int
    var image: String
    var title: String
    var subTitile: String
}

var data = [
    Card(id: 0, image: "g1", title: "Zombie Gunship Survival", subTitile: "Tour the apocalypse"),
    Card(id: 1, image: "g2", title: "Portal", subTitile: "Travel through dimensions"),
    Card(id: 2, image: "g3", title: "Wave Form", subTitile: "Fun enagaging wave game"),
    Card(id: 3, image: "g4", title: "Temple Run", subTitile: "Run for your life"),
    Card(id: 4, image: "g5", title: "World of Warcrat", subTitile: "Be whoever you want"),
    Card(id: 5, image: "g6", title: "Alto’s Adventure", subTitile: "A snowboarding odyssey"),
    Card(id: 6, image: "g7", title: "Space Frog", subTitile: "Jump and have fun"),
    Card(id: 7, image: "g8", title: "Dinosaur Mario", subTitile: "Keep running")
]
