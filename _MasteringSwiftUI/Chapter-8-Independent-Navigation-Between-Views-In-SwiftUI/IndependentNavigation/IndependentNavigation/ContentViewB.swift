//
//  ContentViewB.swift
//  IndependentNavigation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentViewB: View {
    // MARK: - PROPERTIES
    @StateObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HappyDog()
            
            Button(action: {
                viewRouter.currentPage = .page1
            }) {
                BackButtonContent()
            }
        }
    }
}

// MARK: - HAPPY DOG
struct HappyDog: View {
    var body: some View {
        return Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

// MARK: - BACK BUTTON
struct BackButtonContent: View {
    var body: some View {
        return Text("Back")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewB(viewRouter: ViewRouter())
    }
}
#endif
