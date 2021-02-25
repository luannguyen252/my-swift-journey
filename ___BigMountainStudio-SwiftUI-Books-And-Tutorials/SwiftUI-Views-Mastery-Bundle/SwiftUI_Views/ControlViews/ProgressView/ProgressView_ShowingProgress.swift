//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ProgressView_ShowingProgress: View {
    @State private var progress = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ProgressView",
                       subtitle: "Showing Progress",
                       desc: "You can one-way bind data to your ProgressView to show progression.",
                       back: .blue, textColor: .white)
            
            ProgressView(value: progress)
                .padding()
            
            DescView(desc: "And with a label:", back: .blue, textColor: .white)
            
            ProgressView("Progress (\(Int(progress * 100))%)", value: progress)
                .padding()
            
        }
        .font(.title)
    }
}

struct ProgressView_ShowingProgress_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView_ShowingProgress()
    }
}
