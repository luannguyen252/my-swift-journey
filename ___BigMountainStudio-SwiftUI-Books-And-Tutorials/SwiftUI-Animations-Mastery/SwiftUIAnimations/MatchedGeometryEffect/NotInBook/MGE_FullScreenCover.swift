//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_FullScreenCover: View {
    @State private var showDetailView = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Button(action: {
                showDetailView.toggle()
            }, label: {
                Text("Show Details")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Capsule()
                                    .matchedGeometryEffect(id: "transition", in: namespace))
            })
        }
        .accentColor(.blue)
        .fullScreenCover(isPresented: $showDetailView) {
            MGE_FullScreenCoverDetailView(namespace: namespace)
                .transition(.move(edge: .bottom))
        }
        .animation(.easeIn)
    }
}

struct MGE_FullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MGE_FullScreenCover()
        }
    }
}

// Detail View
struct MGE_FullScreenCoverDetailView: View {
    var namespace: Namespace.ID
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .matchedGeometryEffect(id: "transition", in: namespace)
            
            VStack {
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Show Details")
                        .foregroundColor(.white)
                        .padding()
                })
            }
            .accentColor(.blue)
        }
    }
}
