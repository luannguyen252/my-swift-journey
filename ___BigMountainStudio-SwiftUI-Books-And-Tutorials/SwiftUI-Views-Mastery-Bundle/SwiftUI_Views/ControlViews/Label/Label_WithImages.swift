//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Label_WithImages: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Label",
                       subtitle: "With Images",
                       desc: "Instead of SF Symbols, you can also use images.",
                       back: .pink)
            
            Spacer()
            
            Label("Helena", image: "profile")
                .border(Color.pink, width: 3)

            Spacer()
            
            DescView(desc: "It's important to know that the Label will NOT resize your image. You will have to resize your images before they are used in the Label.", back: .pink)
        }
        .font(.title)
    }
}

struct Label_WithImages_Previews: PreviewProvider {
    static var previews: some View {
        Label_WithImages()
    }
}
