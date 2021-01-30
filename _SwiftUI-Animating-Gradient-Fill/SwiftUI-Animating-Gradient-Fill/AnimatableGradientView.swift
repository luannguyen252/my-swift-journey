import SwiftUI

struct AnimatableGradientView: View {
  @State private var gradientA: [Color] = [.white, .red]
  @State private var gradientB: [Color] = [.white, .blue]

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

  var body: some View {
    ZStack {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .opacity(self.firstPlane ? 0 : 1)
        Button(action:{
            withAnimation(.spring()) {
                self.setGradient(gradient: [Color.random(), Color.random()])
            }
        })
        {
            Text("Change gradient")
        }
    }
  }
}

struct AnimatableGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableGradientView()
    }
}
