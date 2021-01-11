import SwiftUI

struct PlayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer()
    }
    
    func updateUIView(_ uiView: UIVideoPlayer, context: Context) {
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
