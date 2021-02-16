import SwiftUI

struct ContentView: View {
    @State var notificationIsVisible = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color(UIColor.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                ToastView(image: "airpodspro", title: "AirPods Pro", subtitle: "Connected")
                    .offset(y: notificationIsVisible ? 0 : -128)
                    .animation(
                        Animation.spring()
                    )
                    .onTapGesture(perform: toggleVisibility)
            }
            .padding()
            .onAppear(perform: toggleVisibility)
            
            Button(action: toggleVisibility) {
                Text(notificationIsVisible ? "Hide" : "Show")
                    .foregroundColor(.primary)
            }
        }
    }
    
    func toggleVisibility() {
        self.notificationIsVisible.toggle()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
