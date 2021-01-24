import SwiftUI

struct Home: View {
    @State var selected: Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        // Header
        HStack {
            Button(action: {
                print("Profile.")
            }, label: {
                HStack(spacing: 8) {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56, height: 56, alignment: .center)
                        .cornerRadius(28)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Luan Nguyen")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(colorScheme == .dark ? Color("white") : Color("black"))
                        
                        Text("Black & White Photographer")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(colorScheme == .dark ? Color("white").opacity(0.6) : Color("black").opacity(0.6))
                    }
                }
            })
            
            Spacer()
            
            Button(action: {
                print("Settings.")
            }, label: {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 24))
                    .foregroundColor(colorScheme == .dark ? Color("white") : Color("black"))
            })
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        
        // Carousel Parallax
        TabView(selection: $selected) {
            // Images
            ForEach(1...7, id: \.self){ index in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    // Geometry Reader For Parallax Effect
                    GeometryReader { reader in
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // Moving view in opposite side when user starts to swipe create Parallax Effect
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                    }
                    .frame(height: height / 2)
                    .cornerRadius(10)
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    // Shadow
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                    // Decreasing width by padding so outer view only decreased inner image will be full width
                    // Bottom Image
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -15, y: 25)
                })
                .padding(.horizontal, 24)
            }
        }
        // Page Tab View
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
