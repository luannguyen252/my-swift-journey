import SwiftUI

struct LinearGradientView1: View {
    @State private var gradientA: [Color] = [.red, .purple]
    @State private var gradientB: [Color] = [.red, .purple]

    @State private var firstPlane: Bool = true

    func setGradient(gradient: [Color]) {
        if firstPlane {
            gradientB = gradient
        }
        else {
            gradientA = gradient
        }
        firstPlane = !firstPlane
    }

    @State private var selected = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))

            LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
                .opacity(self.firstPlane ? 0 : 1)

            TabView(selection: $selected) {
                Text("☀️").font(.title).tag(0)
                Text("🌦").font(.title).tag(1)
                Text("⛈").font(.title).foregroundColor(Color.white).tag(2)
            }
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
            .onChange(of: selected, perform: { value in
                withAnimation(.spring()) {
                    self.setGradient(gradient: [Color.random(), Color.random()])
                }
            })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LinearGradientView1_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView1()
    }
}
