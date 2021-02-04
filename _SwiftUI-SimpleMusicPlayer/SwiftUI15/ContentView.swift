import SwiftUI
import AVKit
import Lottie

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var song: Int = 1
    @State var isPlayingState:Bool = true
    @State var playPauseIcon: String = "play.circle.fill"
    
    var body: some View {
        ZStack {
            Color("dark").edgesIgnoringSafeArea(.all)
            
            VStack{
                LottieView(name: "wave").frame(width:UIScreen.main.bounds.width,height:300)
                Spacer()
                LottieView(name: "sound").frame(width:300,height:300)
            }
            
            VStack {
                Text("Music Player")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("pink2"))
                
                HStack(spacing: 40) {
                    Button(action: {
                        if self.isPlayingState{
                            self.audioPlayer.play()
                            self.playPauseIcon = "pause.circle.fill"
                            print("Play")
                        } else {
                            self.audioPlayer.pause()
                            self.playPauseIcon = "play.circle.fill"
                            print("Pause")
                        }
                        self.isPlayingState.toggle()
                    }, label: {
                        Image(systemName: playPauseIcon)
                            .resizable()
                            .frame(width: 56, height: 56)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("pink2"))
                    })
                    
                    Button(action: {
                        print("Next")
                        self.isPlayingState = false
                        self.playPauseIcon = "pause.circle.fill"
                        if self.song < 3 {
                            self.song += 1
                        } else {
                            self.song = 1
                        }
                        self.audioPlayer.stop()
                        self.audioPlayer = nil
                        let sound  = Bundle.main.path(forResource: "song\(self.song)", ofType: "MP3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }, label: {
                        Image(systemName: "forward.end")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("pink2"))
                    })
                }
            }
        }
        .onAppear {
            let sound  = Bundle.main.path(forResource: "song1", ofType: "MP3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LottieView: UIViewRepresentable {
    @State var name: String
    var loopMode: LottieLoopMode = .loop
    var animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}
