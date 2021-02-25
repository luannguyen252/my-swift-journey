//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toolbar_Location: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "ToolbarItem Location",
                           desc: "You can also specify where you want ToolbarItems located when creating them.",
                           back: .green)
                Spacer()
            }
            .navigationTitle(Text("Toolbar"))
            .font(.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Image(systemName: "aspectratio")
                        Text("Aspect Ratio")
                    }
                }
            }
        }
        .accentColor(.green)
    }
}

struct Toolbar_Location_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_Location()
    }
}
