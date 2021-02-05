import SwiftUI

struct ContentView: View {
    @State var changeIcon = "moon.fill"
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 32) {
                HStack {
                    Label("SwiftUI", systemImage: changeIcon)
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 120))
                        .foregroundColor(Color(changeIcon == "moon.fill" ? "pink2" : "yellow"))
                }
                
                Button(action: {
                    self.changeIcon = "sun.max.fill"
                }, label: {
                    Text("Tap Me")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("light"))
                })
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(changeIcon: "moon.fill")
    }
}
