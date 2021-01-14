import SwiftUI

struct ContentView: View {
  @State private var selection = 0
  
  var body: some View {
    TabView(selection: $selection){
      MyHome()
        .tabItem {
          VStack {
            Text("")
            Image(systemName: "link.circle.fill")
              .foregroundColor(Color.white.opacity(0.7))
              .font(.system(size: 30,
                            weight: .regular))
              .offset(y: 5)
          }
      }
      .tag(0)
      
      MyHome()
        .tabItem {
          VStack {
            Text("")
            Image(systemName: "clock")
              .foregroundColor(Color.white.opacity(0.7))
              .font(.system(size: 30,
                            weight: .regular))
          }
      }
      .tag(1)
      
      Today()
        .tabItem {
          VStack {
            Text("")
            Image(systemName: "circle.grid.2x2.fill")
              .foregroundColor(Color.white.opacity(0.7))
              .font(.system(size: 30,
                            weight: .ultraLight))
              .offset(y: 5)
          }
      }
      .tag(2)
      
      MyHome()
        .tabItem {
          VStack {
            Text("")
            Image(systemName: "ellipsis.circle")
              .foregroundColor(Color.white.opacity(0.7))
              .font(.system(size: 30,
                            weight: .regular))
              .offset(y: 5)
          }
      }
      .tag(3)
      
      MyHome()
        .tabItem {
          VStack {
            Text("")
            Image(systemName: "info.circle.fill")
              .foregroundColor(Color.white.opacity(0.7))
              .font(.system(size: 30,
                            weight: .regular))
              .offset(y: 5)
          }
      }
      .tag(4)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
