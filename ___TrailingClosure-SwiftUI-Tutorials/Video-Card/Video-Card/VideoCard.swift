import SwiftUI

struct VideoCard: View {
    @State var videoURL     :   URL
    @State var showPlayIcon :   Bool
    @State var sizePlayIcon :   CGFloat
    var previewLength       :   Double
    
    var body: some View {
        ZStack {
            VideoView(videoURL: videoURL, previewLength: previewLength)
            if showPlayIcon {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: sizePlayIcon / 2, idealWidth: sizePlayIcon, maxWidth: sizePlayIcon, minHeight: sizePlayIcon / 2, idealHeight: sizePlayIcon, maxHeight: sizePlayIcon, alignment: .center)
                    .foregroundColor(Color.white)
            }
        }
        .onTapGesture {
            print("DID TAP VIDEO")
        }
    }
}

#if DEBUG
struct VideoCard_Previews: PreviewProvider {
    static let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/luan-nguyen-design.appspot.com/o/For-SwiftUI%2FVideo-Intro-Particles.mp4?alt=media&token=79bccf82-3f44-4bbb-8388-ada8295d9730")!
    
    static var previews: some View {
        VideoCard(videoURL: url, showPlayIcon: true, sizePlayIcon: 40, previewLength: 20)
    }
}
#endif
