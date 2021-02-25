import SwiftUI
import SDWebImageSwiftUI

struct RemoteImages: View {
    let myPhotoUrl = URL(string: "https://picsum.photos/200/300")!
    
    var body: some View {
        WebImage(url: myPhotoUrl)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
    }
}

#if DEBUG
struct RemoteImages_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImages()
    }
}
#endif
