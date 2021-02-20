// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// inspired by https://stackoverflow.com/questions/61313187/how-can-i-fit-a-shape-in-swift-ui-to-accommodate-the-length-and-width-of-a-text

struct DarkModeExampleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Button(
                action: {
                    print("Button Tapped")
                },
                label: {
                    HStack {
                        Image(systemName: "tag.fill")
                        Text("Tickets")
                    }
                }
            )
            .buttonStyle(RoundedButtonStyle())
        }
        .navigationBarTitle("\(String(describing: colorScheme))")
    }

}

/// Reusable Button style
struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            configuration.label
                .font(.headline)
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("ButtonColor"), Color("ButtonColorGradient")]), startPoint: .top, endPoint: .bottom)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                )
        }
    }
}

struct DarkModeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach([ColorScheme.light, .dark], id: \.self) { colorScheme in
                NavigationView {
                    DarkModeExampleView()
                }
                .environment(\.colorScheme, colorScheme)
            }

        }
    }
}
