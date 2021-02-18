import SwiftUI
import AVKit

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

// Home Screen
struct Home: View {
    @State var index    = 0
    @State var top      = 0
    @State var data     = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
    ]
    
    var body: some View {
        ZStack {
            PlayerScrollView(data: self.$data)
            
            VStack {
                HStack(spacing: 16) {
                    Button(action: {
                        self.top = 0
                    }) {
                        Text("Following")
                            .foregroundColor(self.top == 0 ? Color("light") : Color("light").opacity(0.45))
                            .font(.custom(self.top == 0 ? "TTFirsNeue-Bold" : "TTFirsNeue-Regular", size: 18))
                            .padding(.vertical)
                    }
                    
                    Button(action: {
                        self.top = 1
                    }) {
                        Text("For You")
                            .foregroundColor(self.top == 1 ? Color("light") : Color("light").opacity(0.45))
                            .font(.custom(self.top == 1 ? "TTFirsNeue-Bold" : "TTFirsNeue-Regular", size: 18))
                            .padding(.vertical)
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 32) {
                        Button(action: {
                            print("Profile is pressed.")
                        }) {
                            Image("pic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            print("Like is pressed.")
                        }) {
                            VStack(spacing: 8) {
                                Image(systemName: "suit.heart.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("light"))
                                
                                Text("10K")
                                    .foregroundColor(Color("light"))
                                    .font(.custom("TTFirsNeue-DemiBold", size: 16))
                            }
                        }
                        
                        Button(action: {
                            print("Message is pressed.")
                        }) {
                            VStack(spacing: 8) {
                                Image(systemName: "message.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("light"))
                                
                                Text("1000")
                                    .foregroundColor(Color("light"))
                                    .font(.custom("TTFirsNeue-DemiBold", size: 16))
                            }
                        }
                        
                        Button(action: {
                            print("Share is pressed.")
                        }) {
                            VStack(spacing: 8) {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("light"))
                                
                                Text("Share")
                                    .foregroundColor(Color("light"))
                                    .font(.custom("TTFirsNeue-DemiBold", size: 16))
                            }
                        }
                    }
                    .padding(.bottom, 56)
                    .padding(.trailing)
                }
                
                HStack(spacing: 0) {
                    Button(action: {
                        self.index = 0
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                            .foregroundColor(self.index == 0 ? Color("light") : Color("light").opacity(0.35))
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 1
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .foregroundColor(self.index == 1 ? Color("light") : Color("light").opacity(0.35))
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        print("Upload is pressed.")
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .background(Color("light"))
                                .frame(width: 56, height: 40, alignment: .center)
                                .cornerRadius(8)
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .medium, design: .default))
                                .foregroundColor(Color("dark"))
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 2
                    }) {
                        Image(systemName: "message.fill")
                            .font(.system(size: 24))
                            .foregroundColor(self.index == 2 ? Color("light") : Color("light").opacity(0.35))
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.index = 3
                    }) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 26))
                            .foregroundColor(self.index == 3 ? Color("light") : Color("light").opacity(0.35))
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
            // Due to all edges are ignored
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color("dark").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

// Player View
struct PlayerView: View {
    @Binding var data : [Video]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<self.data.count) { i in
                ZStack {
                    Player(player: self.data[i].player)
                        // Full screensize because were going to make paging
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                    
                    if self.data[i].replay {
                        Button(action: {
                            // Playing the video again
                            self.data[i].replay = false
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                        }) {
                            Image(systemName: "goforward")
                                .font(.system(size: 40, weight: .medium, design: .default))
                                .foregroundColor(Color("light"))
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            // Doing it for first video because scrollview didnt dragged yet
            self.data[0].player.play()
            
            self.data[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
                // Notification to identify at the end of the video, enabling replay button
                self.data[0].replay = true
            }
        }
    }
}

// Player
struct Player: UIViewControllerRepresentable {
    var player  :   AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view                    =   AVPlayerViewController()
        view.player                 =   player
        view.showsPlaybackControls  =   false
        view.videoGravity           =   .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

    }
}

// Host Status Bar
class Host : UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// Sample video for video playing.
struct Video    :   Identifiable {
    var id      :   Int
    var player  :   AVPlayer
    var replay  :   Bool
}

// Player Scroll View
struct PlayerScrollView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @Binding var data   :   [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        // Each children occupies one full screen so height = count * height of screen
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        // Same here
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // To ignore safe area
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // To dynamically update height based on dat
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0 ..< uiView.subviews.count {
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate {
        var parent  :   PlayerScrollView
        var index   =   0
        
        init(parent1: PlayerScrollView) {
            parent      =   parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currenrindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currenrindex {
                index = currenrindex

                for i in 0 ..< parent.data.count {
                    // Pausing all other videos
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                }
                
                //Pplaying next video
                parent.data[index].player.play()
                
                parent.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
                    // nNtification to identify at the end of the video
                    // Nnabling replay button
                    self.parent.data[self.index].replay = true
                }
            }
        }
    }
}
