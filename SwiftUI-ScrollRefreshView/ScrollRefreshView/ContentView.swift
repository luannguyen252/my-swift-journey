import SwiftUI

struct ContentView: View {
    @State private var isRefreshing = false
    
    func onRefresh() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isRefreshing = false
        }
    }
    
    func onScroll(size: CGSize, frame: CGRect, offset: CGPoint) -> Void {
        print("size", size)
        print("frame", frame)
        print("offset", offset)
    }
    
    func onScrollWillEnd() -> Void {
        print("should load more here")
    }
    
    var body: some View {
        ScrollRefreshView($isRefreshing, onRefresh: onRefresh, onScroll: onScroll, onScrollWillEnd: onScrollWillEnd) {
            LazyVStack {
                ForEach(0..<100, id: \.self) { i in
                    HStack {
                        Text("\(i)")
                        Spacer()
                    }.onAppear {
                        print("\(i)")
                    }
                }
            }.background(Color.gray)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
