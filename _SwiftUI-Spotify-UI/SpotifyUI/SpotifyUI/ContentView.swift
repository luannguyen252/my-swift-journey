import SwiftUI

var titles: [String] {
    return ["Abilene", "Acid Tracks", "Alabama", "Beside You", "Blue Moon",
            "Carioca", "Contemplation", "Dallas Blues", "Downtown", "Evil",
            "Follow Me", "Give It To Me Baby", "Heat Wave", "Inertia Creeps"]
}

var coverImages: [String] {
    var im: Set<String> = []
    for _ in 1 ... 8 {
        let imageID = String((1 ... 8).randomElement()!)
        let imageName = "Image-\(imageID)"
        im.insert(imageName)
    }
    return Array(im)
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MusicListView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                Text("Radio")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }.tag(1)
                Text("Discover")
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Discover")
                    }.tag(2)
                Text("My profile")
                    .tabItem {
                        Image(systemName: "person")
                        Text("My profile")
                    }.tag(3)
            }
            .navigationBarItems(leading: Image(systemName: "text.justifyleft"))
            .navigationTitle("Spotify")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MusicListView: View {
    private var titles: [String] = ["Editor's choice", "Trending", "New Releases", "Popular playlist", "Mood", "Workout", "Sleep", "Detroit City"]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 16) {
                ForEach(titles, id: \.self) { title in
                    MusicCell(title: title, musicList: coverImages)
                }
            }.padding(.vertical, 16)
        })
    }
}

struct MusicCell: View {
    @State var isPresented: Bool = false
    var title: String
    var musicList: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack(spacing: 8) {
                    ForEach(musicList, id: \.self) { album in
                        VStack {
                            Image(album)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(8)
                                .shadow(radius: 1)
                                .frame(width: 140, height: 140, alignment: .center)
                            Text(title)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: 120)
                        }.onTapGesture {
                            isPresented.toggle()
                        }.sheet(isPresented: $isPresented) {
                            DetailView(albumArt: album, title: title)
                        }
                    }
                }.padding(.leading)
            })
        }
    }
}

struct DetailView: View {
    var albumArt: String
    var title: String
    @State private var downloadAmount = 2.4

    @State private var backgroundColor: Color = .white
    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18, alignment: .center)
                        .foregroundColor(.white)
                    Spacer()
                    Text(title)
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0.9102218783, green: 0.9231385766, blue: 1, alpha: 1)))
                    Spacer()
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18, alignment: .center)
                        .foregroundColor(.white)
                }.padding(.vertical)

                Image(albumArt)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 120, height: UIScreen.main.bounds.width - 120)
                    .cornerRadius(2)
                    .shadow(radius: 16)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        Text("hello there")
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22, alignment: .center)
                        .foregroundColor(.gray)
                }.padding()

                VStack(spacing: 5) {
                    ProgressView(value: downloadAmount, total: 5)
                        .frame(height: 4)
                        .accentColor(.white)
                    HStack {
                        Text("2.4")
                            .font(.caption2)
                            .foregroundColor(.white)
                        Spacer()
                        Text("-2.6")
                            .font(.caption2)
                            .foregroundColor(.white)
                    }
                }.padding(16)

                HStack {
                    Image(systemName: "shuffle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56, height: 56, alignment: .center)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "repeat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.gray)
                }.padding()
                Spacer()
                HStack {
                    Image(systemName: "music.house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "music.note.list")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.gray)
                }.padding(.vertical)
                    .padding(.horizontal, 20)
            }.padding()
        }.onAppear {
            setAverageColor(imageName: albumArt)
        }
    }

    private func setAverageColor(imageName: String) {
        let uiColor = UIImage(named: imageName)?.averageColor ?? .white
        backgroundColor = Color(uiColor)
    }
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
