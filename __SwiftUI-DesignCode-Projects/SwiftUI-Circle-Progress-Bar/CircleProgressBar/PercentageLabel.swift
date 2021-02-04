import SwiftUI

struct PercentageLabel: View {
    @Binding var percentage: CGFloat
    @Binding var isDownload: Bool
    
    var body: some View {
        ZStack {
            Text(isDownload ? "\(Int(percentage * 100)) %" : "Start")
                .font(.custom("TTFirsNeue-Bold", size: 32))
                .foregroundColor(Color.bodyText)
        }
        .onTapGesture {
            self.isDownload.toggle()
            self.startLoading()
        }
    }
}

extension PercentageLabel {
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.percentage += 0.01
                if self.percentage >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}
