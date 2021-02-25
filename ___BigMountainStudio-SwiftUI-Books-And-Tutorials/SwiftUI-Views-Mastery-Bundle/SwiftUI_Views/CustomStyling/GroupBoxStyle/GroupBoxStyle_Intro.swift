//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GroupBoxStyle_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GroupBoxStyle",
                       subtitle: "Introduction",
                       desc: "Using the groupBoxStyle modifier you can create custom styling for all your GroupBoxes.",
                       back: .purple)
            
            Text("No Style")
            
            GroupBox(label: Text("Username"), content: {
                Text("SwiftUI4ever")
            })
            
            Divider()
            
            Text("Custom GroupBox Style")
            
            GroupBox(label: Text("Username"), content: {
                Text("SwiftUI4ever")
            })
            .groupBoxStyle(CenteredGroupBoxStyle(backColor: .purple))
        }
        .font(.title)
    }
}

struct CenteredGroupBoxStyle: GroupBoxStyle {
    var backColor: Color = Color.clear
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: 5) {
            configuration.label
                .font(Font.body.lowercaseSmallCaps().weight(.bold))
                .foregroundColor(Color.secondary)
            configuration.content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Rectangle().fill(backColor.opacity(0.2)))
    }
}

struct GroupBoxStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxStyle_Intro()
    }
}
