import SwiftUI

struct MixTeamButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 16).fill(Color.red)
            .brightness(configuration.isPressed ? -1/4 : 0)
            .overlay(configuration.label.foregroundColor(.white))
    }
}

struct CommonButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(style: strokeStyle(isPressed: configuration.isPressed))
                            .foregroundColor(Color.white)
                            .padding(5)
                )
                    .modifier(Shadow(isApplied: !configuration.isPressed))
                    .foregroundColor(Color.white)
        )
    }

    func strokeStyle(isPressed: Bool) -> StrokeStyle {
        if isPressed {
            return StrokeStyle(
                lineWidth: 2,
                dash: [5, 5],
                dashPhase: 5
            )
        }
        return StrokeStyle(
            lineWidth: 2,
            dash: [5, 5],
            dashPhase: 3
        )
    }
}

struct MixTeamButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: action) {
                Text("Mix Team Button Style")
            }
            .frame(height: 50)
            .buttonStyle(MixTeamButtonStyle())

            Button(action: action) {
                Text("Common Button Style (Red)")
            }
            .buttonStyle(CommonButtonStyle(color: .red))

            Button(action: action) {
                Text("Common Button Style (Green)")
            }
            .buttonStyle(CommonButtonStyle(color: .green))

            Button(action: action) {
                Text("Small")
            }
            .buttonStyle(CommonButtonStyle(color: .purple))

            Button(action: action) {
                Image(systemName: "moon")
                Text("With an icon")
            }
            .buttonStyle(CommonButtonStyle(color: .gray))
        }
    }

    private static let action = { }
}
