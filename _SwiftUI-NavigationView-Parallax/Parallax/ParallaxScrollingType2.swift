import SwiftUI

struct ParallaxScrollingType2: View {
    var plot = "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written. SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance."
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            GeometryReader{reader in
                if reader.frame(in: .global).minY > -480 {
                    Image("main")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        // Moving View Up
                        .offset(y: -reader.frame(in: .global).minY)
                        // Going To Add Parallax Effect
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 480 : 480)
                }
            }
            // Default Frame
            .frame(height: 480)

            VStack(alignment: .leading,spacing: 15) {
                Text("SwiftUI")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                    }
                }
                
                Text("Better apps. Less code.")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                
                Text(plot)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                
                HStack(spacing: 15) {
                    Button(action: {
                        print("Bookmark")
                    }, label: {
                        Text("Bookmark")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })

                    Button(action: {
                        print("Read More")
                    }, label: {
                        Text("Read More")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                .padding(.top, 25)
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .background(Color.black)
            .cornerRadius(20)
            .offset(y: -35)
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ParallaxScrollingType2_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxScrollingType2()
    }
}
