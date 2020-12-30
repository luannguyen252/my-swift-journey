//
//  ContentView.swift
//  SwiftUIQuickActionCard
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var quickActionShown: Bool = false
    
    var body: some View {
        ZStack {
            Button("Show Card") {
                withAnimation {
                     self.quickActionShown.toggle()
                }
            }

            if quickActionShown {
                CardView(isPresented: $quickActionShown) {
                    // Your view to display in the card
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Professional lorem ipsum generator for typographers")
                            .font(.system(size: 32))
                            .fontWeight(.heavy)
                            .padding(.vertical, 0)
                            .padding(.horizontal, 0)
                        HStack {
                            Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .padding(.vertical, 0)
                                .padding(.horizontal, 0)
                                .opacity(0.6)
                        }
                    }
                    .padding()
                }
                // Modifiers
                .cardCornerRadius(20)
                .enableHapticFeedback()
                .dismissButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
