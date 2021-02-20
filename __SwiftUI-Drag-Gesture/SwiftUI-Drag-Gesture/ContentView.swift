import SwiftUI

struct ContentView: View {
    @State private var tapped: Bool = false
    @State private var draggedOffset = CGSize.zero
    @State private var cardBackground = Color("pink2")
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(cardBackground)
                    
                    Text(tapped ? "You're tapped the card" : "Tap the card")
                        .foregroundColor(Color("dark"))
                        .font(.custom("Chivo-Bold", size: 24))
                }
                .padding(.top, 16)
                /// 1.  SPRING DEAULT
                // .animation(.spring())
                /// 2. SPRING SET VALUE
                .animation(.spring(response: 0.5, dampingFraction: 0.7))
                /// 3. LINEAR
                // .animation(.linear(duration: 0.3))
                /// 4. EASE IN OUT
                // .animation(.easeInOut(duration: 0.3))
                .offset(y: self.draggedOffset.height)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.draggedOffset = value.translation
                                self.cardBackground = Color("orange")
                            }
                            .onEnded { value in
                                self.draggedOffset = CGSize.zero
                                self.cardBackground = Color("green")
                            }
                )
                .gesture(TapGesture(count: 1).onEnded({ () in
                    self.tapped.toggle()
                }))
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
