//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ProgressView_Customizing: View {
    @State private var progress = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ProgressView",
                       subtitle: "Customizing",
                       desc: "You can set the color of the progress indicator with an accent color and the text that goes with it by using a different initializer.",
                       back: .blue, textColor: .white)
            
            ProgressView(value: progress, label: {
                HStack {
                    Spacer()
                    Text("Progress (\(Int(progress * 100))%)")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                }
            })
            .accentColor(.orange)
            .padding()
            .background(RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue)
                            .shadow(radius: 10, y: 16))
            .padding(.horizontal)
            
            Text("For the circular progress view, you need to set the color through the style modifier:")
                .padding(.horizontal)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
        }
        .font(.title)
    }
}

struct ProgressView_Customizing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView_Customizing()
    }
}
