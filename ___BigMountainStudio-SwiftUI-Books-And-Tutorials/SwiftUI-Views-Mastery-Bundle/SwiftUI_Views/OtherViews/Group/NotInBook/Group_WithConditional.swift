//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Group_WithConditional: View {
    @State private var progress: String? = "0 min"
    @State private var isCompleted: Bool? = true
    
    var body: some View {
        Group {
            if let progressText = progress {
                Text(progressText)
                    .fontWeight(.semibold)
            } else if isCompleted! {
                Text("Second Condition")
                    .fontWeight(.semibold)
            } else {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray)
                    .frame(width: 150, height: 20)
            }
        }
        .font(Font.title)
        .foregroundColor(.primary)
        .padding(.bottom, 4)
    }
}

struct Group_WithConditional_Previews: PreviewProvider {
    static var previews: some View {
        Group_WithConditional()
    }
}
