import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: Batch()) {
                    Text("Batch")
                }

                NavigationLink(destination: ContextMenuView()) {
                    Text("ContextMenuView")
                }
                
                NavigationLink(destination: DragAndDrop()) {
                    Text("DragAndDrop")
                }
                
                NavigationLink(destination: OneTap()) {
                    Text("OneTap")
                }
            }
            .navigationBarTitle("TabGesture")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
