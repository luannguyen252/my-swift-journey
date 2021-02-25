import SwiftUI

struct OnboardScreen: View {
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset : CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("dark")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Spacer(minLength: 0)
                
                VStack(spacing: 24) {
                    Image(systemName: "swift")
                        .font(.system(size: 96))
                        .foregroundColor(Color("pink"))
                    
                    VStack(spacing: 8) {
                        Text("SwiftUI")
                            .font(.custom("TTFirsNeue-Bold", size: 56))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("light"))
                        
                        Text("Better apps. Less code.")
                            .font(.custom("TTFirsNeue-Regular", size: 24))
                            .fontWeight(.regular)
                            .foregroundColor(Color("light"))
                            .padding(.top, 8)
                            .padding(.bottom, 16)
                    }
                }
                
                Spacer(minLength: 0)
                
                // Slider
                ZStack {
                    Capsule()
                        .fill(Color("light").opacity(0.1))
                    
                    Text("Swipe To Start")
                        .foregroundColor(Color("light"))
                        .opacity(offset > 1 ? 0.25 : 1)
                        .animation(.easeInOut(duration: 0.3))
                        .font(.custom("TTFirsNeue-DemiBold", size: 18))
                        .padding(.leading, 16)
                    
                    HStack {
                        Capsule()
                            .fill(Color("pink"))
                            .frame(width: calculateWidth() + 64)
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        ZStack {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 24))
                        }
                        .foregroundColor(Color("light"))
                        .frame(width: 64, height: 64)
                        .background(Color("pink"))
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture()
                                    .onChanged(onChanged(value:))
                                    .onEnded(onEnded(value:)))
                        
                        Spacer()
                    }
                }
                .frame(width: maxWidth, height: 64)
                .padding(.bottom, 16)
            }
        }
    }
    
    // Show process width with background color when user begin drag
    func calculateWidth() -> CGFloat {
        let percent = offset / maxWidth
        return percent * maxWidth
    }
    
    // When user begin drag, show process behind the dragger
    func onChanged(value: DragGesture.Value) {
        if value.translation.width > 0 && offset <= maxWidth - 64 {
            offset = value.translation.width
        }
        
    }
    
    // When user drag to end, and go to next screen
    func onEnded(value: DragGesture.Value) {
        withAnimation(Animation.easeInOut(duration: 0.3)) {
            if offset > 180 {
                offset = maxWidth - 64
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                }
            } else {
                offset = 0
            }
        }
    }
}

#if DEBUG
struct OnboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardScreen()
            .previewLayout(.sizeThatFits)
    }
}
#endif
