//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_CapitalLetterOptions: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Text",
                       subtitle: "Capital Letter Options",
                       desc: "You have a few different options when it comes to capital letters.",
                       back: .green, textColor: .white)
            Text("This is the TEST text - 123")
            
            DescView(desc: "lowercaseSmallCaps", back: .green, textColor: .white)
            Text("This is the TEST text - 123")
                .font(Font.title.lowercaseSmallCaps())
            
            DescView(desc: "uppercaseSmallCaps", back: .green, textColor: .white)
            Text("This is the TEST text - 123")
                .font(Font.title.uppercaseSmallCaps())
            
            DescView(desc: "smallCaps", back: .green, textColor: .white)
            Text("This is the TEST text - 123")
                .font(Font.title.smallCaps())
        }
        .font(.title)
    }
}

struct Text_CapitalLetterOptions_Previews: PreviewProvider {
    static var previews: some View {
        Text_CapitalLetterOptions()
    }
}
