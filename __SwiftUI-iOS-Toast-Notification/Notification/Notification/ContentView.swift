import SwiftUI

struct ContentView: View {
    @State var notificationIsVisible = false
    @Environment(\.colorScheme) var colorScheme
    
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
                    .font(.custom("TTFirsNeue-Bold", size: 24))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 32)
                    .frame(width: 144, height: 56, alignment: .center)
                    .foregroundColor(Color("white"))
                    .background(Capsule().fill(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : .black)))
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
