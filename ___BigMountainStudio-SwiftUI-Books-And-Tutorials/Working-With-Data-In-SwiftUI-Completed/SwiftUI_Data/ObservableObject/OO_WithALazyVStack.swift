//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class OO_ViewModel: ObservableObject {
    static var shared = OO_ViewModel()
    
    @Published var items: [Item] = []
    
    init() {
        items = [Item(name: "Mark"),
                 Item(name: "Miles"),
                 Item(name: "Chris"),
                 Item(name: "Chase")]
    }
}

struct Item: Identifiable {
    var id = UUID()
    var name = ""
}

struct OO_WithALazyVStack: View {
    @ObservedObject var data = OO_ViewModel.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(data.items) { item in
                        NavigationLink(destination: OO_WithALazyVStack_DetailView(item: item)) {
                            OO_WithALazyVStack_RowView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Observable Objects")
        }
    }
}

struct OO_WithALazyVStack_RowView: View {
    var item: Item
    
    var body: some View {
        Text(item.name)
            .padding()
    }
}

struct OO_WithALazyVStack_DetailView: View {
    var item: Item!
    
    var body: some View {
        Text(item.name)
    }
}

struct OO_WithALazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        OO_WithALazyVStack()
    }
}
