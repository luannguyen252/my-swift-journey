//
//  Blur_UnderneathView.swift
//  100Views
//
//  Created by Mark Moeykens on 8/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Blur_UnderneathView: View {
    @State private var showingModal = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HeaderView("Blur", subtitle: "Underneath Layers", desc: "This is a screen that is underneath the popup being shown.",
                           back: Color.blue, textColor: .white)
                Button("Show Popup", action: { showingModal = true })
                Spacer()
            }
            // Blur only when the modal popup is showing
            .blur(radius: $showingModal.wrappedValue ? 3 : 0)
            
            // The Custom Popup is on top of the screen
            if $showingModal.wrappedValue {
                ZStack {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    
                    // This VStack is the popup
                    VStack(spacing: 20) {
                        Text("Popup with the view underneath blurred")
                            .padding().font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                        Spacer()
                        Button("Close", action: { showingModal = false })
                            .padding()
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 20)
                }
            }
        }
        .font(.title)
    }
}

struct Blur_UnderneathView_Previews: PreviewProvider {
    static var previews: some View {
        Blur_UnderneathView()
    }
}
