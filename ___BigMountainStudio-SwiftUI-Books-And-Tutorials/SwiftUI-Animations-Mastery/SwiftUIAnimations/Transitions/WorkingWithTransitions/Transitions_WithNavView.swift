//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Transitions_WithNavView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List(0 ..< 5) { item in
                    NavigationLink(destination: Transition_Screen2()) {
                        Text("Row \(item)")
                    }
                }
                .navigationTitle("Transitions")
                
                Button(action: {}, label: {
                    Image(systemName: "plus.circle.fill")
                        .padding()
                        .font(.system(size: 60))
                })
                .transition(.opacity)
            }
        }
        .font(.title)
        .accentColor(.red)
        .animation(.default)
        .onDisappear {
            print("Disappearing")
        }
    }
}

struct Transitions_WithNavView_Previews: PreviewProvider {
    static var previews: some View {
        Transitions_WithNavView()
    }
}

struct Transition_Screen2: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List(0 ..< 5) { item in
                Text("Row \(item)")
            }
            
            Button(action: {}, label: {
                Image(systemName: "plus.circle.fill")
                    .padding()
                    .font(.system(size: 60))
            })
        }
        .font(.title)
        .navigationTitle("Transitions - 2")

    }
}
