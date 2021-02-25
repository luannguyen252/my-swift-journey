import SwiftUI

struct ContentView: View {
    @State var maxHeight : CGFloat = UIScreen.main.bounds.size.height / 2 - 56
    static let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/luan-nguyen-design.appspot.com/o/For-SwiftUI%2FVideo-Intro-Space.mp4?alt=media&token=81e6871b-f0b6-4559-a6bd-2c5f3c9cec81")!
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .bottomLeading) {
                VideoView(videoURL: URL(string: "https://firebasestorage.googleapis.com/v0/b/luan-nguyen-design.appspot.com/o/For-SwiftUI%2FVideo-Intro-Particles.mp4?alt=media&token=79bccf82-3f44-4bbb-8388-ada8295d9730")!, previewLength: 60)
                    .cornerRadius(16)
                    .frame(width: nil, height: maxHeight, alignment: .center)
                    .shadow(color: Color("dark").opacity(0.7), radius: 30, x: 0, y: 2)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)

            Spacer()
            
            ZStack {
                VideoCard(videoURL: ContentView.url, showPlayIcon: true, sizePlayIcon: 56, previewLength: 60)
                    .cornerRadius(16)
                    .frame(width: nil, height: maxHeight, alignment: .center)
                    .shadow(color: Color("dark").opacity(0.7), radius: 30, x: 0, y: 2)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 24)
            
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
