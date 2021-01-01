//
//  ContentView.swift
//  SwiftUIiOS14Onboarding
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Hello")
                    .font(.system(size: 48, weight: .bold))
                    .padding(.bottom)
                
                Spacer()
                
                NavigationLink(destination: LanguageView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Capsule().fill(Color("AccentColor")))
                }
            }
            .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
