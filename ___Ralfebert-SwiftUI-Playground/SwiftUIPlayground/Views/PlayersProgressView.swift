// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct PlayerLoopView: View {
    @ObservedObject var player: Player

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10.0))
                .foregroundColor(Color.purple)
                .opacity(0.3)

            Circle()
                .trim(
                    from: 0,
                    to: player.isPlaying ? 1.0 : 0.0
                )
                .stroke(
                    style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round)
                )
                .animation(
                    player.isPlaying ?
                        Animation.linear(duration: player.duration)
                        .repeatForever(autoreverses: false) : nil
                )
                .rotationEffect(Angle(degrees: -90))
                .foregroundColor(Color.purple)
        }
        .frame(width: 100, height: 100)
        .padding()
    }
}

struct PlayersProgressView: View {
    @ObservedObject var engine = Engine()

    var body: some View {
        NavigationView {
            VStack {
                ForEach(self.engine.players) { player in
                    HStack {
                        Text("Player")
                        PlayerLoopView(player: player)
                    }
                }
            }
            .navigationBarItems(trailing:
                HStack {
                    Button("Add Player") {
                        self.engine.addPlayer()
                    }
                    Button("Play All") {
                        self.engine.playAll()
                    }
                    Button("Stop All") {
                        self.engine.stopAll()
                    }
                }.padding()
            )
        }
    }
}

class Player: ObservableObject, Identifiable {
    var id = UUID()
    @Published var isPlaying: Bool = false
    var duration: Double = 10

    func play() {
        self.isPlaying = true
    }

    func stop() {
        self.isPlaying = false
    }
}

class Engine: ObservableObject {
    @Published var players = [Player]()

    func addPlayer() {
        let player = Player()
        players.append(player)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            player.isPlaying = true
        }
    }

    func stopAll() {
        self.players.forEach { $0.stop() }
    }

    func playAll() {
        self.players.forEach { $0.play() }
    }
}

struct PlayersProgressView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersProgressView()
    }
}
