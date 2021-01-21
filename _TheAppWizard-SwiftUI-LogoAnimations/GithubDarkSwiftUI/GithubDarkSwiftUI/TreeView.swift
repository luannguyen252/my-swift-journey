import SwiftUI

struct TreeView: View {
    @State var treeblink = false
    
    var body: some View {
        ZStack {
            Image("6")
                .resizable()
                .frame(width: 400, height: 235, alignment: .center)
                .opacity(treeblink ? 1: 0)
                .animation(Animation.easeOut(duration: 0.2).delay(0.6).repeatCount(2))
                .onAppear(){
                    self.treeblink.toggle()
                }
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
