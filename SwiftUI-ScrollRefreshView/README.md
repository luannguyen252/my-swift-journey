# ScrollRefreshView

SwiftUI ScrollView with Pull to Refresh.

Use `UIViewControllerRepresentable` wrap UIKit's `UIScrollView` for SwiftUI. Contains Pull to Refresh feature and `scrollViewDidScroll` Event.

One regretful thing, the `LazyVStack` doesn't work in this wrap View. It's not lazy, almost like `VStack`. :-(

### Nov, 2020 Updated: the best solution -> https://github.com/cattla/ScrollViewWithRefresh . 

```
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
            VStack {
                ForEach(0..<100, id: \.self) { obj in
                    HStack {
                        Text("\(obj)")
                        Spacer()
                    }
                }
            }.background(Color.gray)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

```


![ScrollRefreshView](https://raw.githubusercontent.com/cattla/ScrollRefreshView/main/ScrollRefreshView/demo.gif)
