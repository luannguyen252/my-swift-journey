import SwiftUI

struct LoaderView: View {
    @State var isAnimating = false
    @State var loading = true
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Loader(isAnimating: self.isAnimating)
                .frame(width: self.isAnimating ? 150 : 100)
                .animation(Animation.easeInOut(duration: 0.75).repeatForever(autoreverses: true))
            TimerView()
                .opacity(self.loading ? 0 : 1)
                .animation(Animation.easeOut(duration: 0.35))
        }
        .onAppear {
            self.isAnimating = true
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (Timer) in
                self.isAnimating = false
                self.loading = false
            }
        }
    }
}

struct Loader: View {
    let smallBarHeight: CGFloat = 45
    let mediumBarHeight: CGFloat = 75
    let barWidth: CGFloat = 13
    let isAnimating: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: self.isAnimating ? 25: 10) {
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: barWidth, height: mediumBarHeight)
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: barWidth, height: smallBarHeight)
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: barWidth, height: self.isAnimating ? mediumBarHeight + smallBarHeight / 1.25 : mediumBarHeight)
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: barWidth, height: smallBarHeight)
            Capsule(style: .continuous)
                .fill(Color.white)
                .frame(width: barWidth, height: mediumBarHeight)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
