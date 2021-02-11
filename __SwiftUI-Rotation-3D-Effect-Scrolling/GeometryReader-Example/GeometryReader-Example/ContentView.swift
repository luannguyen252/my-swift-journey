import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        // GeometryReader provide values such as width and height of card position
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: (.global)).minX) / 20),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 56)
            }
        }
        .statusBar(hidden: true)
    }
}

// Section View
struct SectionView: View {
    var section     : Section
    var frameWidth  : CGFloat = 275
    var frameHeight : CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.title)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                    HStack(spacing: 8) {
                        Image(section.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32, alignment: .center)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 0) {
                            Text("\(section.subtitle)".uppercased())
                                .font(.custom("TTFirsNeue-DemiBold", size: 16))
                                .foregroundColor(Color("dark").opacity(0.8))
                            Text("\(section.time) mins")
                                .font(.custom("TTFirsNeue-Regular", size: 14))
                                .foregroundColor(Color("dark").opacity(0.5))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer(minLength: 0)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(color: Color("dark").opacity(0.1), radius: 16)
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .frame(width: frameWidth, height: frameHeight)
        .background(section.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: section.backgroundColor.opacity(0.1), radius: 16, x: 0, y: 16)
    }
}

// Section Data Model
struct Section: Identifiable{
    var id              = UUID()
    var title           : String
    var subtitle        : String
    var logo            : String
    var image           : Image
    var backgroundColor : Color
    var time            : Int
}

// Section Data
let sectionData = [
    Section(title: "SwiftUI for Designers Part 1", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar1"), backgroundColor: Color("green"), time: 15),
    Section(title: "SwiftUI for Designers Part 2", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar2"), backgroundColor: Color("orange"), time: 30),
    Section(title: "SwiftUI for Designers Part 3", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar3"), backgroundColor: Color("yellow"), time: 15),
    Section(title: "SwiftUI for Designers Part 4", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar4"), backgroundColor: Color("red"), time: 30),
    Section(title: "SwiftUI for Designers Part 5", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar5"), backgroundColor: Color("pink"), time: 15),
    Section(title: "SwiftUI for Designers Part 6", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar6"), backgroundColor: Color("purple2"), time: 30),
    Section(title: "SwiftUI for Designers Part 7", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar7"), backgroundColor: Color("blue"), time: 15),
    Section(title: "SwiftUI for Designers Part 8", subtitle: "Luan Nguyen", logo: "profile", image: Image("avatar8"), backgroundColor: Color("blue2"), time: 30),
]

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
