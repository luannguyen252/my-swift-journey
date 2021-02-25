import SwiftUI

struct Detail: View {
    @ObservedObject var detail: DetailViewModel
    var animation: Namespace.ID
    @State var scale: CGFloat = 1
    
    var body: some View {
        ScrollView {
            VStack {
                // Updated Code For Avoiding Top Scroll
                GeometryReader { reader in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(detail.selectedItem.contentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "image" + detail.selectedItem.id, in: animation)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

                        HStack {
                            Text(detail.selectedItem.overlay)
                                .font(.custom("TTFirsNeue-Bold", size: 24))
                                .foregroundColor(Color("dark"))
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                withAnimation(.spring()){
                                    detail.show.toggle()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        // Since we ignored top area
                        .padding(.top,UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                    }
                    .offset(y: (reader.frame(in: .global).minY > 0 && scale == 1) ? -reader.frame(in: .global).minY : 0)
                    // Gesture for closing detail view
                    .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                
                HStack {
                    Image(detail.selectedItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(detail.selectedItem.title)
                            .font(.custom("TTFirsNeue-Bold", size: 24))
                            .foregroundColor(Color("dark"))
                        Text(detail.selectedItem.category)
                            .font(.custom("TTFirsNeue-Regular", size: 14))
                            .foregroundColor(Color("dark4"))
                    }
                    
                    Spacer(minLength: 0)
                    
                    GetButtonView()
                }
                .matchedGeometryEffect(id: "content" + detail.selectedItem.id, in: animation)
                .padding()
                
                Text("""
SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.

SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance. This declarative style even applies to complex concepts like animation. Easily add animation to almost any control and choose a collection of ready-to-use effects with only a few lines of code. At runtime, the system handles all of the steps needed to create a smooth movement, and even deals with interruption to keep your app stable. With animation this easy, you’ll be looking for new ways to make your app come alive.

Xcode 11 includes intuitive new design tools that make building interfaces with SwiftUI as easy as dragging and dropping. As you work in the design canvas, everything you edit is completely in sync with the code in the adjoining editor. Code is instantly visible as a preview as you type, and any change you make to that preview immediately appears in your code. Xcode recompiles your changes instantly and inserts them into a running version of your app, visible, and editable at all times.
""")
                    .font(.custom("TTFirsNeue-Regular", size: 16))
                    .foregroundColor(Color("dark2"))
                    .padding()

                Button(action: {
                    print("Share is pressed.")
                }) {
                    Label(title: {
                        Text("Share")
                            .foregroundColor(.primary)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,25)
                    .background(Color("dark").opacity(0.1))
                    .cornerRadius(8)
                }
                .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChanged(value: DragGesture.Value) {
        // Calculating scale value by total height
        let scale = value.translation.height / UIScreen.main.bounds.height
        
        // If scale is 0.1 means the actual scale will be 1- 0.1 => 0.9
        // Limiting scale value
        if 1 - scale > 0.75 {
            self.scale = 1 - scale
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.spring()) {
            // Closing detail view when scale is less than 0.9
            if scale < 0.9{
                detail.show.toggle()
            }
            scale = 1
        }
    }
}
