//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ProgressView_CurrentValue: View {
    @State private var progress = 0.2
    @State private var current = 20
    @State private var total = 100

    var body: some View {
        VStack(spacing: 40) {
            HeaderView("ProgressView",
                       subtitle: "Current Value Label",
                       desc: "You can also use the currentValueLabel parameter to indicate progress values.",
                       back: .blue, textColor: .white)
            
            ProgressView(value: progress, label: {
                Text("Fetching Records")
            }, currentValueLabel: {
                Text("\(current) out of \(total)")
            })
                .padding()
            Text("Allows customizations:")
            ProgressView(value: progress, label: {
                Text("Fetching Records")
            }, currentValueLabel: {
                Text("\(current) out of \(total)")
                    .font(.title3)
                    .italic()
                    .foregroundColor(.green)
            })
                .padding()
        }
        .font(.title)
    }
}

struct ProgressView_CurrentValue_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView_CurrentValue()
    }
}
