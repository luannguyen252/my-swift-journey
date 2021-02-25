//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_Customization: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Customization",
                           desc: "You can customize NavigationLink just like you would with a Button.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                
                NavigationLink(destination: SecondView()) {
                    Text("Navigate")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16)
                                        .shadow(radius: 10, y: 15))
                }
                .accentColor(.pink)
                
                NavigationLink(destination: SecondView()) {
                    HStack {
                        Text("Navigate")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("NavigationLink")
        }
        .font(.title)
    }
}

struct NavLink_Customization_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_Customization()
    }
}
