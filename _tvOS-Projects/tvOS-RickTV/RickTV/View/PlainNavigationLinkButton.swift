import SwiftUI

struct PlainNavigationLinkButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    PlainNavigationLinkButton(configuration: configuration)
  }
}

struct PlainNavigationLinkButton: View {
  @Environment(\.isFocused) var focused: Bool
  let configuration: ButtonStyle.Configuration

  var body: some View {
    configuration.label
      .scaleEffect(focused ? 1.1 : 1)
      .focusable(true)
  }
}
