//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Menu_MaxItems: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Menu {
                    Button("Menu Item 1", action: {})
                    Button("Menu Item 2", action: {})
                    Button("Menu Item 3", action: {})
                    Button("Menu Item 4", action: {})
                    Button("Menu Item 5", action: {})
                    Button("Menu Item 6", action: {})
                    Button("Menu Item 7", action: {})
                    Button("Menu Item 8", action: {})
                    Button("Menu Item 9", action: {})
                    Menu("More...") {
                        Button("Menu Item 10", action: {})
                        Button("Menu Item 11", action: {})
                    }
                    
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding(.leading, 20)
                }
                Spacer()
            }
            
            Spacer()
            
            HeaderView("Menu",
                       subtitle: "Maximum Buttons",
                       desc: "Like all SwiftUI containers, you can only have 10 views inside the Menu. Embed another menu for more actions.",
                       back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

struct Menu_MaxItems_Previews: PreviewProvider {
    static var previews: some View {
        Menu_MaxItems()
    }
}
