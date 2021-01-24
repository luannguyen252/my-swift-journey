import SwiftUI

struct ContentView: View {
    @StateObject private var model = ListDataModel()

    func onScroll(frame: CGRect, offset: CGPoint) -> Void {
            // print("frame", frame)
            // print("offset", offset)
        }
    
    var body: some View {
        NavigationView {
            ScrollViewWithRefresh(refreshing: self.$model.refreshing, onScroll: onScroll) {
                LazyVStack {
                    ForEach(model.data, id: \.self) { i in
                        HStack {
                            Text("\(i)")
                            Spacer()
                        }
                        .background(Color(.systemGray6))
                    }
                    if model.shouldLoadMore {
                        ProgressView()
                            .padding()
                            .onAppear {
                                model.loadMore()
                            }
                    } else {
                        Text("No more Data")
                            .padding()
                    }
                    
                }
            }
            .navigationBarTitle("ScrollViewWithRefresh", displayMode: .inline)
        }
    }
}

// List Data Model
class ListDataModel: ObservableObject {
    private var _loadingMore: Bool = false
    
    @Published var data: [Int] = Array(0...100)
    @Published var shouldLoadMore: Bool = true
    @Published var refreshing: Bool = false {
        didSet {
            if oldValue == false, refreshing == true {
                refresh()
            }
        }
    }

    func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let firstKid = self.data.first! - 1
            self.data.insert(firstKid, at: 0)
            withAnimation(.easeInOut) {
                self.refreshing = false
            }
        }
    }
    
    func loadMore() {
        if self._loadingMore { return }
        self._loadingMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.data.append(contentsOf: Array(self.data.count...(self.data.count + 50)))
            self._loadingMore = false
            if self.data.count > 200 {
                self.shouldLoadMore = false
            }
        }
    }
}
