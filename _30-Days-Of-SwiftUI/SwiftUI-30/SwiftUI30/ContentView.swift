import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basic")) {
                    NavigationLink(destination: PlusASecond()) {
                        // Text("Plus A Second")
                        MainListItem(title: "Plus A Second", description: "Click the button to plus a second")
                    }
                    NavigationLink(destination: DarkModeTest()) {
                        MainListItem(title: "Dark Mode", description: "A view to show how dark mode works")
                    }
                    NavigationLink(destination: ColorMixer()) {
                        MainListItem(title: "Color Mixer", description: "Use slider to change color")
                    }
                    NavigationLink(destination: TypefaceComparison(rotationX: 0.0)) {
                        MainListItem(title: "Typeface Comparison", description: "Text comparison")
                    }
                    NavigationLink(destination: CatScene()) {
                        MainListItem(title: "Cat Scene", description: "3D model presentation using SceneKit")
                    }
                    NavigationLink(destination: AnimationTextField()) {
                        MainListItem(title: "Animation Text Field", description: "Cool animation")
                    }
                    NavigationLink(destination: ZStackCard()) {
                        MainListItem(title: "Z Stack Cards", description: "Card stack")
                    }
                }
                Section(header:Text("Metal")) {
                    NavigationLink(destination: MetalTest()) {
                        MainListItem(title: "Metal Fragment", description: "A Metal view test")
                    }
                    NavigationLink(destination: Sun()) {
                        MainListItem(title: "Sun Canvas", description: "Metal kernel function test")
                    }
                }
                Section(header: Text("Animation")) {
                    NavigationLink(destination: BreathView(radius: 55)) {
                        MainListItem(title: "Breath View", description: "Apple Watch breath")
                    }
                }
            }
            .navigationBarTitle(Text("30 Days of SwiftUI"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12 Pro Max")
            .environment(\.colorScheme, .dark)
    }
}
