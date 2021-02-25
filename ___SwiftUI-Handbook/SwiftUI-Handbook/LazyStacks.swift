import SwiftUI

struct LazyStacks: View {
    var body: some View {
        LazyVStackView()
        LazyVGridView()
    }
}

// LazyVStack
struct LazyVStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0 ..< 10000) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(height: 100)
                        .shadow(radius: 100)
                }
            }
            .padding()
        }
    }
}

// LazyVGrid
struct LazyVGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(0 ..< 10000) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(height: 100)
                        .shadow(radius: 100)
                }
            }
            .padding()
        }
    }
}

#if DEBUG
struct LazyStacks_Previews: PreviewProvider {
    static var previews: some View {
        LazyStacks()
    }
}
#endif
