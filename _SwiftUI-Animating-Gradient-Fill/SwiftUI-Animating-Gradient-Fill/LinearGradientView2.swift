import SwiftUI

struct LinearGradientView2: View {
    @State private var selected = 0
    
    var blueBackground = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomLeading)

    var grayBackground = LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .topLeading, endPoint: .bottomLeading)

    var gradients: [LinearGradient] {
        return [blueBackground, grayBackground, grayBackground]
    }

    var body: some View {
        ZStack {
            if selected == 0 {
                Rectangle().fill(gradients[0]).edgesIgnoringSafeArea(.all)
            } else {
                Rectangle().fill(gradients[1]).edgesIgnoringSafeArea(.all)
            }

            TabView(selection: $selected){
                Text("☀️").font(.title).tag(0)
                Text("🌦").font(.title).tag(1)
                Text("⛈").font(.title).foregroundColor(Color.white).tag(2)
            }.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
        }.animation(.easeIn)
    }
}

struct LinearGradientView2_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView2()
    }
}
