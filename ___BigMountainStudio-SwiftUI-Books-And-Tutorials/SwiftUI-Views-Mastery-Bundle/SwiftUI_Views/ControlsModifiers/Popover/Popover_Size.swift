//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Popover_Size: View {
    @State var showingPopover = false
    
    var body: some View {
        GeometryReader { gp in
                VStack(spacing: 20) {
                    HeaderView("Popover",
                               subtitle: "Sizing",
                               desc: "Sometimes the popover size doesn't quite look the way you want. You can use add a flexible frame to the popover content for better rendering.",
                               back: .blue, textColor: .white)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.showingPopover.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .popover(isPresented: $showingPopover) {
                        List(0..<100) {
                            Text("\($0)")
                        }
//                        .frame(minWidth: gp.size.width/2, maxWidth: .infinity,
//                               minHeight: gp.size.height/2, maxHeight: .infinity)
                    }
                    .padding(30)
                }
            }
                .font(.title)
        }
    }
}

struct Popover_Size_Previews: PreviewProvider {
    static var previews: some View {
        Popover_Size()
//            .previewDevice("iPad Pro (9.7-inch)")
    }
}
