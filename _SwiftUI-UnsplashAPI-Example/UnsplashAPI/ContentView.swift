import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var randomImages = UnsplashData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(randomImages.photoArray, id: \.id) { photo in
                        WebImage(url: URL(string: photo.urls["regular"]!))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(24)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Unsplash API")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
