import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: page2()) {
                Text("page")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct page2:View {
    var body: some View{
        NavigationLink(destination: page3()){
            Text("page 3")
        }
    }
}

struct page3:View {
    var body: some View{
        Text("Page 3")
    }
}
