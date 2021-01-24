import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image("header")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                    } else {
                        Image("header")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
            
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipped()
                        .cornerRadius(28)
                    VStack(alignment: .leading) {
                        Text("Article by")
                            // .font(.custom("AvenirNext-Regular", size: 16))
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text("Luan Nguyen")
                            // .font(.custom("AvenirNext-Demibold", size: 16))
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top, 24)
                
                Text("SwiftUI - Better apps. Less code.")
                    // .font(.custom("AvenirNext-Bold", size: 32))
                    .font(.system(size: 32))
                    .fontWeight(.heavy)
                    .lineLimit(nil)
                    .padding(.top, 16)
                
                Text("3 min read - 24 January 2021")
                    // .font(.custom("AvenirNext-Regular", size: 14))
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                Text(articleContent)
                    // .font(.custom("AvenirNext-Regular", size: 24))
                    .font(.system(size: 18))
                    .lineLimit(nil)
                    .padding(.top, 32)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("Share.")
                    }, label: {
                        Text("Share")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    })
                    .foregroundColor(.white)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 32)
                    .background(Capsule().fill(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black))
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
             .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let articleContent =
"""
SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.

Build user interfaces for any Apple device using just one set of tools and APIs.

With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync.

Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.

SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field.

Your code is simpler and easier to read than ever before, saving you time and maintenance.

This declarative style even applies to complex concepts like animation. Easily add animation to almost any control and choose a collection of ready-to-use effects with only a few lines of code. At runtime, the system handles all of the steps needed to create a smooth movement, and even deals with interruption to keep your app stable. With animation this easy, you’ll be looking for new ways to make your app come alive.


"""
