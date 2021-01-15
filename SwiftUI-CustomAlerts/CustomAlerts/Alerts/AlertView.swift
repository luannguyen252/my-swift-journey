//
//  AlertView.swift
//  CustomAlerts
//
//  Created by Umer Khan on 23/11/2020.
//

import SwiftUI

struct AlertView: View {
    @Binding var showingAlert: Bool
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 300, height: 250)
            VStack {
                Spacer()
                Text("Message")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("This is custom alert and it is looking awesome")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                Button(action: {
                    showingAlert = false
                }, label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 180, height: 40)
                        Text("Dismiss")
                            .foregroundColor(.white)
                    }.foregroundColor(.green)
                })
                Spacer()
            }
            
        }
        .frame(width: 300, height: 260)
        .shadow(radius: 5)
        .transition(
            AnyTransition
                .scale(scale: 1.3)
                .combined(with: .opacity)
                .animation(
                    .easeInOut(duration: 0.15)
                )
        )
        .foregroundColor(Color.black.opacity(0.8))
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(showingAlert: .constant(true))
    }
}
