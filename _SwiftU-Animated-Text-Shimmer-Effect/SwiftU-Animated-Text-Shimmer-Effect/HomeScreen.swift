import SwiftUI

struct HomeScreen: View {
    @State var multiColor = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                TextShimmer(text: "SwiftUI", multiColors: $multiColor)
                TextShimmer(text: "Better apps", multiColors: $multiColor)
                TextShimmer(text: "Less code", multiColors: $multiColor)
            }
            .padding(.bottom, 24)
            
            Toggle(isOn: $multiColor, label: {
                Text("Multi Color Effect")
                    .font(.system(size: 16, weight: .semibold, design: .default))
            })
        }
        .statusBar(hidden: true)
        .padding(16)
        .preferredColorScheme(.dark)
    }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewLayout(.sizeThatFits)
    }
}
#endif
