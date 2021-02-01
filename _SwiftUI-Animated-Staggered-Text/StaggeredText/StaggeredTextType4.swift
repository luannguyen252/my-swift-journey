import SwiftUI

struct StaggeredTextType4: View {
    @State private var isShown: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("SwiftUI")
                        .font(.custom("TTFirsNeue-Bold", size: 56))
                        .offset(x: 0, y: isShown ? 0 : -72)
                        .opacity(isShown ? 1 : 0)
                        .padding(4)
                        .foregroundColor(Color("blue"))
                        .animation(Animation.easeOut.delay(isShown ? 0.1 : 0.2))
                    
                    Text("Build Apps")
                        .font(.custom("TTFirsNeue-Bold", size: 56))
                        .offset(x: 0, y: isShown ? 0 : -72)
                        .opacity(isShown ? 1 : 0)
                        .padding(4)
                        .foregroundColor(Color("purple"))
                        .animation(Animation.easeOut.delay(0.15))
                    
                    Text("Less Code")
                        .font(.custom("TTFirsNeue-Bold", size: 56))
                        .offset(x: 0, y: isShown ? 0 : -72)
                        .opacity(isShown ? 1 : 0)
                        .padding(4)
                        .foregroundColor(Color("red"))
                        .animation(Animation.easeOut.delay(isShown ? 0.2 : 0.1))
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isShown.toggle()
                    }) {
                        Text(isShown ? "Hide" : "Show")
                            .font(.custom("TTFirsNeue-DemiBold", size: 24))
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 48)
                            // .foregroundColor(isShown ? Color("green") : Color("orange"))
                            .foregroundColor(Color("dark"))
                            // .background(Capsule().fill(isShown ? Color("green").opacity(0.15) : Color("orange").opacity(0.15)))
                            .background(Capsule().fill(isShown ? Color("orange") : Color("yellow")))
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 24)
            }
            .padding(16)
            
            Spacer()
        }
        .background(Color("white"))
        .ignoresSafeArea(.all, edges: .all)
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct StaggeredTextType4_Previews: PreviewProvider {
    static var previews: some View {
        StaggeredTextType4()
    }
}
#endif
