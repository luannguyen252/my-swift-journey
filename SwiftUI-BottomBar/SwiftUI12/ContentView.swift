import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            page1()
                .tabItem {
                    VStack {
                        Text("House")
                        Image(systemName: "house.fill")
                    }
            }
            page2()
                .tabItem {
                    VStack {
                        Text("Fire")
                        Image(systemName: "flame.fill")
                    }
            }
            page3()
                .tabItem {
                    VStack {
                        Text("Share")
                        Image(systemName: "paperplane.fill")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct page1:View{
    var body: some View {
        Text("Page1").fontWeight(.heavy)
    }
}

struct page2:View{
    var body: some View {
        Text("Page2").fontWeight(.heavy)
    }
}
struct page3:View{
    var body: some View {
        Text("Page3").fontWeight(.heavy)
    }
}
