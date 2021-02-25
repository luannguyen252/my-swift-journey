import SwiftUI

struct Home: View {
    var body: some View {
        // Geometry Reader for geeting frame
        GeometryReader { reader in
            let rect = reader.frame(in: .global)
            
            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    // Buttons
                    NavigationLink(
                        destination: AddItem(),
                        label: {
                            NavButton(image: "plus", title: "Add", rect: rect, color: Color("pink"))
                        })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(
                        destination: DeleteMemo(),
                        label: {
                            NavButton(image: "trash", title: "Delete", rect: rect, color: Color("red"))
                        })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
                
                HStack(spacing: 24) {
                    // Buttons
                    NavigationLink(
                        destination: ViewMemo(),
                        label: {
                            NavButton(image: "doc.plaintext", title: "View", rect: rect, color: Color("blue"))
                        })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(
                        destination: RatingMemo(),
                        label: {
                            NavButton(image: "star", title: "Rating", rect: rect, color: Color("orange"))
                        })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
            }
        }
    }
}

// Navigation Button
struct NavButton: View {
    var image   : String
    var title   : String
    var rect    : CGRect
    var color   : Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .font(.system(size: 32))
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.custom("TTFirsNeue-Bold", size: 10))
                .foregroundColor(Color("light"))
        }
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
