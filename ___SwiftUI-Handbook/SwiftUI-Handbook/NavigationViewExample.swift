import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationViewWrapperExample()
        NavigationTitleExample()
        NavigationBarItemsExample()
        NavigationLinkExample()
    }
}

// Navigation View Wrapper
struct NavigationViewWrapperExample: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 1000)
                    .padding()
            }
        }
    }
}

// Navigation Title
struct NavigationTitleExample: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 1000)
                    .padding()
            }
            .navigationTitle("Today")
        }
    }
}

// Navigation Bar Items
struct NavigationBarItemsExample: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 1000)
                    .padding()
            }
            .navigationTitle("Today")
            .navigationBarItems(trailing: Image(systemName: "person.crop.circle"))
        }
    }
}

// Navigation Link
struct NavigationLinkExample: View {
    var body: some View {
        NavigationLink(destination: Text("New View")) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 1000)
                .padding()
        }
    }
}

#if DEBUG
struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
#endif
