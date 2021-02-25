//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HeaderView: View {
    var title = "Title"
    var subtitle = "Subtitle"
    var desc = "Use this to..."
    var back = Color.orange
    var textColor = Color.black
    
    init(_ title: String, subtitle: String, desc: String,
         back: Color = Color.orange, textColor: Color = Color.black) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing: 15) {
            if !title.isEmpty {
                Text(title)
                    .font(.largeTitle)
            }
            
            Text(subtitle)
                .foregroundColor(.gray)
            
            DescView(desc, back: back, textColor: textColor)
        }
    }
}

struct DescView: View {
    var desc = "Use this to..."
    var back = Color.orange
    var textColor = Color.black
    
    init(_ desc: String, back: Color = .orange,
         textColor: Color = .black) {
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(back)
            .foregroundColor(textColor)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView("Title", subtitle: "Subtitle", desc: "What does what",
                   back: .green, textColor: .white)
    }
}
