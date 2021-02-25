//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct RoundedRectangle_CornerSize: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("RoundedRectangle",
                       subtitle: "CornerSize",
                       desc: "You can customize the height and width of the rounded corners.",
                       back: .blue)
            
            Text("Corner width: 40, height: 60")
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 60))
                .fill(Color.blue)
                .padding()
            
            Text("Corner width: 60, height: 40")
            RoundedRectangle(cornerSize: CGSize(width: 60, height: 40))
                .fill(Color.blue)
                .padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct RoundedRectangle_CornerSize_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle_CornerSize()
    }
}
