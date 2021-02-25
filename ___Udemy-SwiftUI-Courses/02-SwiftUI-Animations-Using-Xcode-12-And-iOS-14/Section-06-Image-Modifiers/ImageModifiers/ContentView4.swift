import SwiftUI

struct ContentView4: View {
    @State private var img: UIImage? = nil
    let staticImage = UIImage(named: "avatar1")
    
    var body: some View {
        Image(uiImage: self.img ?? staticImage!)
            .resizable()
            .onAppear(perform: imageDownloader)
            .frame(width: 200, height: 200, alignment: .center)
            .onTapGesture {
                print("Image was tapped.")
            }
    }
    
    func imageDownloader() {
        guard let imageURL = URL(string: "https://picsum.photos/400/400?i=30") else {
            print("Could not find images at this URL")
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let imageData = data, let imageToDisplay = UIImage(data: imageData) {
                self.img = imageToDisplay
            } else {
                print("Error \(String(describing: error))")
            }
        }
        .resume()
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
