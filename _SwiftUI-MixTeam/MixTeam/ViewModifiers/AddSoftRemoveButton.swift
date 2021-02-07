import SwiftUI

struct AddSoftRemoveButton: ViewModifier {
    let remove: () -> Void
    @State private var isRealRemoveButtonDisplayed = false

    func body(content: Content) -> some View {
        HStack {
            contentAndMinusButton(content).overlay(filterIfNeeded)
            if isRealRemoveButtonDisplayed {
                deleteButton
            }
        }
    }

    private func contentAndMinusButton(_ content: Content) -> some View {
        content.overlay(minusButton, alignment: .topTrailing)
    }

    private var minusButton: some View {
        VStack {
            if !isRealRemoveButtonDisplayed {
                Button(action: displayRealRemoveButton) {
                    Image(systemName: "minus.circle")
                }
            }
        }
        .foregroundColor(.white)
        .padding()
    }

    private var deleteButton: some View {
        Button(action: remove) {
            VStack(spacing: 20) {
                Text("Delete!")
                Image(systemName: "minus.circle.fill")
            }
        }
        .buttonStyle(CommonButtonStyle(color: .red))
        .transition(.move(edge: .trailing))
        .padding(.leading)
    }

    @ViewBuilder private var filterIfNeeded: some View {
        Button(action: hideRealRemoveButton) {
            Color.black
                .opacity(isRealRemoveButtonDisplayed ? 2/10 : 0)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }.allowsHitTesting(isRealRemoveButtonDisplayed)
    }

    private func displayRealRemoveButton() {
        withAnimation {
            isRealRemoveButtonDisplayed = true
        }
    }

    private func hideRealRemoveButton() {
        withAnimation {
            isRealRemoveButtonDisplayed = false
        }
    }
}
