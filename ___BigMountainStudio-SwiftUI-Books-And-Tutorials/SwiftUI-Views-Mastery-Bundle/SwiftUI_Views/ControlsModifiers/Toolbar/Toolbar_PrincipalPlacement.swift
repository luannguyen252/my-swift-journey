//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toolbar_PrincipalPlacement: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("NavigationView",
                           subtitle: "Customized Nav Bar",
                           desc: "You can add views to the NavigationView with a ToolbarItem with a placement of \"principal\".",
                           back: .green)
                    .padding(.top)
                
                Spacer()
            }
            .font(.title)
            .navigationTitle("Nav Bar Title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 0) {
                        Text("My List")
                            .bold()
                        Button(action: {}, label: {
                            Text("Scroll to Top")
                            Image(systemName: "chevron.up")
                        })
                    }
                }
            }
        }
        .accentColor(.green)
    }
}

struct Toolbar_PrincipalPlacement_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_PrincipalPlacement()
    }
}
