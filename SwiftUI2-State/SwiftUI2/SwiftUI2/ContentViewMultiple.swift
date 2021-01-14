import SwiftUI

struct ContentViewMultiple: View {
    @Binding var counter:Int
    @SceneStorage("bold") var showBold:Bool = false
    @AppStorage("globalCounter") var globalCounter = 0
    
    var body: some View {
        if showBold == true {
            Text("Counter = \(globalCounter)").bold()
        }
        else {
            Text("Counter = \(globalCounter)")
        }
        
        Button {
            globalCounter = globalCounter + 1
        } label: {
            Text("Increase")
        }
        
        Button {
            showBold.toggle()
        } label: {
            Text("Switch")
        }
    }
}

struct ContentViewMultiple_Previews: PreviewProvider {
    @State var counter = 0
    
    static var previews: some View {
        ContentViewMultiple_Previews_Wrapper()
    }
    
    struct ContentViewMultiple_Previews_Wrapper: View {
        @State var counter = 0

        var body: some View {
            ContentViewMultiple(counter:$counter)
        }
      }
}
