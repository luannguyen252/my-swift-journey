import SwiftUI

struct ScoreRingView: View {
    var currentScore: Double
    var leftColor: Color
    var rightColor: Color

    var lineWidth: CGFloat = 50
    var dash: [CGFloat] = [4, 10]

    var currentPoints: String {
        return "\(Int(currentScore * 100))"
    }

    var body: some View {
        VStack {
            Text("OVERALL SCORE")
                .font(.headline)
                .kerning(1)

            ZStack {
                CustomCircle(leftColor: .secondary, rightColor: Color.secondary.opacity(0.2), currentScore: 1)

                CustomCircle(leftColor: leftColor, rightColor: rightColor, currentScore: currentScore)

                VStack {
                    Text(currentPoints)
                        .font(.system(.title))
                        .bold()
                        .accessibility(label: Text("\(currentPoints) points"))

                    Text("OUT OF 100")
                        .font(.system(size: 15))
                        .kerning(1)
                        .foregroundColor(.secondary)
                }
                .accessibilityElement(children: .combine)
            }
            .offset(y: 40)
            .padding(.bottom, -10)
        }
    }
}

struct CustomCircle: View {
    var leftColor: Color
    var rightColor: Color
    var currentScore: Double

    var size: CGFloat {
        UIScreen.main.bounds.width / 2
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: CGFloat(currentScore) / 2)
            .stroke(LinearGradient(gradient: Gradient(colors: [rightColor, leftColor]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 80, lineCap: .butt, lineJoin: .bevel, dash: [7, 11]))
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-180))
    }
}

struct ScoreRingView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRingView(currentScore: 0.8, leftColor: .red, rightColor: .purple)
    }
}
