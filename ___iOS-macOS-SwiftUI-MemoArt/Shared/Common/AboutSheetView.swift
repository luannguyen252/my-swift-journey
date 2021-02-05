import SwiftUI
import ComposableArchitecture
import RenaudJennyAboutView

struct AboutSheetView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                AboutView(
                    appId: "id1536330844",
                    logo: {
                        Image("Pixel Art")
                            .resizable()
                            .modifier(AddCardStyle(foregroundColor: .red))
                            .frame(width: 120, height: 120)
                    }
                )
                .buttonStyle(aboutBoutonStyle)
                .padding(.bottom, 30)
                .background(
                    Image("Motif")
                        .resizable(resizingMode: .tile)
                        .renderingMode(.template)
                        .opacity(1/16)
                )
                VStack {
                    Spacer()
                    Button { viewStore.send(.hideAbout) } label: {
                        Text("Done")
                    }
                    .padding()
                }
            }
        }
    }

    private var aboutBoutonStyle: some PrimitiveButtonStyle {
        #if os(macOS)
        return LinkButtonStyle()
        #else
        return DefaultButtonStyle()
        #endif
    }
}
