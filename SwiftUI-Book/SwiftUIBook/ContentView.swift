
import SwiftUI

struct ContentView: View {
  
  private let items: [BookSelectionView] = [
    BookMessengerAppView().build(),
    BookMatchedAnimationView().build(),
    MultipleModalView().build(),
    CustomButtonView().build(),
    IgnoringSafeAreaInsetsView().build(),
    PublishedContentView().build(),
    FluxContentView().build(),
    MountUnmountTransitionView().build(),
    BookDragView().build(),
  ]
  
  var body: some View {

    NavigationView {
      ScrollView {
        VStack {
          ForEach(items) { page in
            page
          }
        }
      }
      .navigationBarTitle("SwiftUIBook")
    }
  }
}



#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

