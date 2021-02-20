// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ImageExampleView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            Image("cookies")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)

            Image(systemName: "sun.max")
                .font(.system(size: 60))

        }

    }
}

struct ImageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageExampleView()
    }
}
