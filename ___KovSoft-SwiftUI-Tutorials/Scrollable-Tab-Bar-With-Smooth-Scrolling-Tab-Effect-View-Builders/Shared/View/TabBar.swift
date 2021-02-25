import SwiftUI

struct TabBar: View {
    @Binding var offset: CGFloat
    @Binding var showCapsule: Bool
    @State var width: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy -> AnyView in
            // Equal width
            let equalWidth = proxy.frame(in: .global).width / CGFloat(tabs.count)
            
            DispatchQueue.main.async {
                self.width = equalWidth
            }

            return AnyView(
                ZStack(alignment: .bottomLeading, content: {
                    Capsule()
                        .fill(Color("dark"))
                        .frame(width: equalWidth - 16, height: showCapsule ? 40 : 4)
                        .offset(x: getOffset() + 7)
                    
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Text(tabs[index])
                                .font(.custom("TTFirsNeue-Bold", size: 18))
                                .foregroundColor(showCapsule ? (getIndexFromOffset() == CGFloat(index) ? Color("light") : Color("dark")) : Color("light"))
                                .frame(width: equalWidth, height: 40)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    // Setting offset
                                    withAnimation {
                                        offset = UIScreen.main.bounds.width * CGFloat(index)
                                    }
                                }
                        }
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                .clipShape(Capsule())
            )
        }
        .padding()
        .frame(height: 40)
    }
    
    // Calculating offset
    func getOffset() -> CGFloat {
        let progress = offset / UIScreen.main.bounds.width
        return progress * width
    }
    
    func getIndexFromOffset() -> CGFloat {
        let indexFloat = offset / UIScreen.main.bounds.width
        
        return indexFloat.rounded(.toNearestOrAwayFromZero)
    }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
