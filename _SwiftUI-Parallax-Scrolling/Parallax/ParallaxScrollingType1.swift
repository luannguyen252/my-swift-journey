import SwiftUI

struct ParallaxScrollingType1: View {
    var plot = """
SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.

Build user interfaces for any Apple device using just one set of tools and APIs.

With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync.

Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.

SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field.

Your code is simpler and easier to read than ever before, saving you time and maintenance.

This declarative style even applies to complex concepts like animation. Easily add animation to almost any control and choose a collection of ready-to-use effects with only a few lines of code. At runtime, the system handles all of the steps needed to create a smooth movement, and even deals with interruption to keep your app stable. With animation this easy, you’ll be looking for new ways to make your app come alive.
"""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            GeometryReader { reader in
                Image("header1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    // Moving View Up
                    .offset(y: -reader.frame(in: .global).minY)
                    // Going To Add Parallax Effect
                    .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 480)
            }
            // Default Frame
            .frame(height: 480)

            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("SwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("light"))
                    
                    HStack(spacing: 8) {
                        ForEach(1...5, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.yellow)
                        }
                    }
                }
                
                Text("Better apps. Less code.")
                    .font(.title3)
                    .foregroundColor(Color("dark2"))
                    .padding(.top, 4)
                
                Text(plot)
                    .padding(.top, 16)
                    .foregroundColor(Color("light"))
                
                HStack(spacing: 16) {
                    Spacer()
                    
                    Button(action: {
                        print("Bookmark")
                    }, label: {
                        Text("Bookmark")
                            .fontWeight(.bold)
                            .foregroundColor(Color("dark"))
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                            .background(Color("yellow"))
                            .cornerRadius(8)
                    })

                    Button(action: {
                        print("Read More")
                    }, label: {
                        Text("Read More")
                            .fontWeight(.bold)
                            .foregroundColor(Color("dark"))
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                            .background(Color("pink"))
                            .cornerRadius(8)
                    })
                    
                    Spacer()
                }
                .padding(.top, 24)
            }
            .padding(.top, 24)
            .padding(.horizontal)
            .background(Color("dark"))
            .cornerRadius(24)
            .offset(y: -35)
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color("dark").edgesIgnoringSafeArea(.all))
        .statusBar(hidden: true)
    }
}

struct ParallaxScrollingType1_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxScrollingType1()
    }
}
