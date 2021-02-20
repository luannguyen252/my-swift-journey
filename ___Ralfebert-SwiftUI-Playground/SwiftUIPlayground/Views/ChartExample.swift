// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import KeyboardAware
import SwiftUI

struct MonthValue: Identifiable {
    var id = UUID()
    var month: Int
    var value: Int
}

/// Inspired by https://stackoverflow.com/questions/61846963/how-to-ensure-view-appears-above-other-views-when-iterating-with-foreach-in-swif
struct ChartExampleView: View {

    let dataPoints = (1 ... 12).map { MonthValue(month: $0, value: Int.random(in: 0 ... 100)) }

    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            HStack(alignment: .bottom, spacing: 15.0) {
                ForEach(dataPoints) { dataPoint in
                    VStack(spacing: 5) {
                        LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                            .frame(width: 12, height: CGFloat(dataPoint.value))
                            .cornerRadius(5)
                        Text("\(dataPoint.month)")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct ChartExample_Previews: PreviewProvider {
    static var previews: some View {
        ChartExampleView()
    }
}
