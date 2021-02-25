import SwiftUI

struct SwitchStatement: View {
    var language: String = "French"
    
    var body: some View {
        switch language {
            case "French":
                    Text("Bonjour!")
            case "Spanish":
                    Text("Hola!")
            case "Chinese":
                    Text("你好!")
            default:
                    Text("Hello!")
        }
    }
}

#if DEBUG
struct SwitchStatement_Previews: PreviewProvider {
    static var previews: some View {
        SwitchStatement()
    }
}
#endif
