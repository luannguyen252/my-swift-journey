import SwiftUI

struct ContentView: View {
    enum Tab { case list, grid, uikit }
    
    var body: some View {
        TabView {
            VerticalList().tabItem { Text("Vertical List") }.tag(Tab.list)
            GridView().tabItem { Text("Grid View") }.tag(Tab.grid)
            UIKitView().tabItem { Text("UIKit View") }.tag(Tab.uikit)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// Vertical List
struct VerticalList: View {
    var lists = ItemList.testLists
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(lists, id: \.id) { list in
                    HorizontalList(items: list.items).id(list.id)
                }
            }
        }
    }
}

// Horizontal List
struct HorizontalList: View {
    let items: [Item]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(items, id: \.id) { item in
                    ItemView(item: item)
                }
            }
        }
    }
}

// Grid View
struct GridView: View {
    var items = (0...100).map { _ in Item() }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(items, id: \.id) { item in
                    ItemView(item: item)
                }
            }
        }
    }
}

// UIKit View
struct UIKitView: UIViewRepresentable {
    static var controller = ViewController()
    
    func makeUIView(context: Context) -> some UIView {
        Self.controller.itemView = AnyView(
            Button("HEJ", action: { print("HEJ") })
                .background(Color.yellow)
                .frame(width: 200, height: 200)
                .buttonStyle(CardButtonStyle())
        )
            
        return Self.controller.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
