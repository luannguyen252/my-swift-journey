import SwiftUI

struct ContentView: View {
    @State private var condition = false
    
    private var conditionalText:String? {
        if condition == true {
            return "Conditional text TRUE"
        }
        return nil
    }
    
    var body: some View {
        Button {
            condition.toggle()
        } label: {
            Text("Press here...")
        }
        
        ConditionalView(conditionalText: conditionalText)
        
        if condition {
            SwitchView(text:"True", type:.italic)
        }
        else {
            SwitchView(text:"False", type:.red)
        }
        
        Button(action: {
            condition.toggle()
        }) {
            Text("This is a button")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
