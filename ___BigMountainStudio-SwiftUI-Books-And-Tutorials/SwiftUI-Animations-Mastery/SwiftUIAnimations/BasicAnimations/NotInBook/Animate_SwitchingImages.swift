//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Animate_SwitchingImages: View {
    @State private var isCancel = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Opacity")
            BannerText("Problems with using if else or ternary operator for image names and animation.", backColor: .blue, textColor: .white)
            
            Toggle(isOn: $isCancel) {
                Text("Change isCancel")
            }
            .padding(.horizontal)
            
            Button(action: {
                
            }) {
                ZStack {
//                    if isCancel {
                        Image("Cancel")
                            .opacity(isCancel ? 1 : 0)
//                    } else {
                        Image("Save")
                            .opacity(isCancel ? 0 : 1)
//                    }
                }
                    //                Image(isCancel ? "Cancel" : "Save")
                    .foregroundColor(.blue)
                    .padding()
                    .animation(.default)
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Animate_SwitchingImages_Previews: PreviewProvider {
    static var previews: some View {
        Animate_SwitchingImages()
    }
}
