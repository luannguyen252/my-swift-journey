import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Spacer(minLength: 0)
                
                Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                    .font(.system(size: 56))
                    .foregroundColor(Color(isOn ? "pink2" : "dark3"))
                    .shadow(color: Color(isOn ? "pink2" : "dark3"), radius: 40, x: 0, y: 0)
                    .animation(.easeIn(duration: 0.3))
                
                Spacer(minLength: 0)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.isOn.toggle()
                }, label: {
                    Text("Turn \(isOn ? "Off" : "On")")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 32)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("pink2"))
                        .background(Capsule().fill(Color("pink2").opacity(0.15)))
                })
                
                Spacer(minLength: 0)
            }
            .onTapGesture {
                self.isOn.toggle()
            }
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
