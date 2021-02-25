import SwiftUI

struct ContentView: View {
    @State var complete     : Bool = false
    @State var inProgress   : Bool = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            AsyncButton(isComplete: complete, action: {
                inProgress = true
                // Start Async Task (Download, Submit, etc)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        complete = true
                    }
                }
            }) {
                Text(complete || inProgress ? "" : "Submit")
                    .font(.custom("TTFirsNeue-Bold", size: 24))
                    .foregroundColor(Color("white"))
            }
        }
        .statusBar(hidden: true)
    }
}

// Async Button
struct AsyncButton<Content: View>: View {
    var isComplete      : Bool
    let action          : ()->()
    let content         : Content
    var textColor       : Color
    var bgColor         : Color
    var completeMark    : Image
    
    @State private var inProgress: Bool
    
    init(isComplete: Bool, action: @escaping ()->(), @ViewBuilder label: ()->Content) {
        self.action         = action
        self.isComplete     = isComplete
        self.content        = label()
        self._inProgress    = State.init(initialValue: false)
        self.textColor      = Color("white")
        self.bgColor        = Color("orange") // pink2
        self.completeMark   = Image(systemName: "checkmark") // hand.thumbsup.fill
    }
    
    var body: some View {
        Button(action: {
            if !inProgress { action() }
            withAnimation(Animation.easeInOut(duration: 0.4)) {
                inProgress = true
            }
        }, label: {
            VStack(alignment: .trailing) {
                if inProgress && !isComplete {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: textColor))
                } else if isComplete {
                    completeMark
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(textColor)
                } else {
                    content
                }
            }
            .frame(maxWidth: isComplete || inProgress ? 64 : .infinity, maxHeight: isComplete  || inProgress ? 64 : nil, alignment: .center)
            .padding(.vertical, isComplete  || inProgress ? 0 : 16)
            .foregroundColor(textColor)
            .background(bgColor)
            .cornerRadius(isComplete || inProgress ? 32 : 8)
            .font(Font.body.weight(.semibold))
            .padding(.all, 16)
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
