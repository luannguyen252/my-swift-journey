import SwiftUI

struct ContentView: View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("light").ignoresSafeArea(.all, edges: .all)
            
            ZStack {
                if !show {
                    ScrollView {
                        HStack {
                            VStack {
                                Text("Title").foregroundColor(.white)
                                    .matchedGeometryEffect(id: "title", in: namespace)
                            }
                            .frame(width: 100, height: 100)
                            .background(
                                Rectangle()
                                    .matchedGeometryEffect(id: "shape", in: namespace)
                            )
                            Rectangle()
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                        .padding(8)
                    }
                } else {
                    VStack {
                        Text("Title").foregroundColor(.white)
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .background(
                        Rectangle()
                            .matchedGeometryEffect(id: "shape", in: namespace)
                    )
                }
            }
            .onTapGesture(perform: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    self.show.toggle()
                }
            })
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
