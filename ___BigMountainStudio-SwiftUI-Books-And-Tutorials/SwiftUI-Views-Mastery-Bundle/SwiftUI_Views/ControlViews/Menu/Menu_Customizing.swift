//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Menu_Customizing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Menu",
                       subtitle: "Customizing",
                       desc: "The label parameter can be any composition of views.",
                       back: .blue, textColor: .white)
            Spacer()
            
            Menu {
                Button(action: {}) {
                    Text("Add color")
                    Image(systemName: "eyedropper.full")
                }
                Button(action: {}) {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Change contrast")
                }
                Button(action: {}) {
                    Text("Skew")
                    Image(systemName: "skew")
                }
            } label: {
                VStack(spacing: 16) {
                    Image(systemName: "paintbrush.pointed.fill")
                    Text("Editing Options")
                }
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()
        }
        .font(.title)
    }
}

struct Menu_Customizing_Previews: PreviewProvider {
    static var previews: some View {
        Menu_Customizing()
    }
}
