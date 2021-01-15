import SwiftUI

struct ContentView: View {
    @State  var currentPage = 1
    
    var body: some View {
        ZStack {
            Page1()
                .opacity(currentPage == 1 ? 1 : 0)
                .offset(x : currentPage == 1 ? 0 : 100)
                .animation(Animation.spring())
            
            Page2()
                .opacity(currentPage == 2 ? 1 : 0)
                .offset(x : currentPage == 2 ? 0 : 100)
                .animation(Animation.spring())
            
            Page3()
                .opacity(currentPage == 3 ? 1 : 0)
                .offset(x : currentPage == 3 ? 0 : 100)
                .animation(Animation.spring())
            
            MyTabView(currentPage: $currentPage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
