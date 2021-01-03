//
//  ContentView.swift
//  IndependentNavigation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentViewA: View {
    // MARK: - PROPERTIES
    @StateObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        VStack {
            GrumpyDog()
            
            Button(action: {
                viewRouter.currentPage = .page2
            }) {
                NextButtonContent()
            }
        }
    }
}

// MARK: - NEXT BUTTON
struct NextButtonContent: View {
    var body: some View {
        Text("Next")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

// MARK: - GRUMPY DOG
struct GrumpyDog: View {
    var body: some View {
        Image("grumpyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA(viewRouter: ViewRouter())
    }
}
#endif
