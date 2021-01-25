import SwiftUI

struct Home: View {
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    @State var show = false
    
    // Row To Grid Animations
    @State var colums = Array(repeating: GridItem(.flexible(), spacing: 16), count: 1)
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Parallaax Effect
                    GeometryReader { reader -> AnyView in
                        // Anyview can be used to return Geomtry Reader Property
                        // Checking If Top Scroll
                        let y = reader.frame(in: .global).minY + maxHeight
                        
                        if y < 0 {
                            // TogglingTop Sticky Header
                            withAnimation(.linear) { show = true }
                        } else {
                            withAnimation(.linear) { show = false }
                        }
                        
                        return AnyView(
                            Image("p10")
                                .resizable()
                                .frame(height: maxHeight)
                                // Avoding Bottom Scroll
                                .offset(y: -reader.frame(in: .global).minY)
                        )
                    }
                    .frame(height: maxHeight)

                    LazyVGrid(columns: colums,spacing: 24) {
                        ForEach(albums,id: \.album_name) { album in
                            AlbumRow(album: album,columns: $colums)
                        }
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(16)
                }
            }
            
            // Sticky Header
            HStack(spacing: 16) {
                Image("p10")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Now Playing")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("Lover - Taylor Swift")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                // Buttons
                Button(action: {
                    print("Pause Pressed.")
                }) {
                    Image(systemName: "pause.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    if colums.count == 2 { colums.removeLast() } else{ colums.append(GridItem(.flexible(), spacing: 16)) }
                }) {
                    Image(systemName: colums.count == 2 ? "rectangle.grid.1x2" : "rectangle.3.offgrid")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(BlurView(style: .systemMaterialDark))
            .opacity(show ? 1 : 0)
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
