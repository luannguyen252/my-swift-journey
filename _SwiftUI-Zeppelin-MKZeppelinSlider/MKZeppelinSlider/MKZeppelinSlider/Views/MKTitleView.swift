import SwiftUI

struct MKTitleView: View {
    @State var showChoose: Bool = false

    let appearingDelay: Double
    private let chooseOffsetY: CGFloat = 37

    private var transition: AnyTransition {
        AnyTransition
            .move(edge: .bottom)
            .combined(with: .opacity)
    }

    var body: some View {
        ZStack(alignment: .leading) {
            if showChoose {
                Text("Choose")
                    .accentColor(.black)
                    .font(Font.system(size: 40).weight(.semibold))
                    .transition(transition)
                    .offset(y: -self.chooseOffsetY)
                    .padding(.top, 10)
            }
            ZStack {
                Color.zPink
                    .padding(.top, self.chooseOffsetY)
                Text("quantity.")
                    .accentColor(.black)
                    .font(Font.system(size: 80).weight(.medium))
                    .layoutPriority(1)
            }
        }
        .clipped()
        .transition(.move(edge: .top))
        .onAppear {
            withAnimation(Animation.easeOut.delay(self.appearingDelay)) {
                self.showChoose.toggle()
            }
        }
    }
}

struct MKTitleView_Previews: PreviewProvider {

    static var previews: some View {
        MKTitleView(appearingDelay: 0.5)
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
