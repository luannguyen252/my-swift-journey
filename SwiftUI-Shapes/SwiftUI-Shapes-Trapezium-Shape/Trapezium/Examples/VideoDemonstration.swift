//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

// Inspiration: https://www.pinterest.com/pin/772297036084032345/

import SwiftUI

struct VideoDemonstration: View {
    @State private var change = true
    @Environment(\.presentationMode) var presentationMode
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 40.0) {
            ZStack {
                TrapeziumShape(offset: 0.5, corner: .bottomRight)
                    .fill(Color.gray.opacity(0.25))
                
                Image("jordan-steranka")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300.0)
                    .clipShape(TrapeziumShape(offset: change ? 0.65 : 1))
                    .shadow(radius: 16)
                    .overlay(TrapeziumShape(offset: change ? 0.65 : 1).stroke(Color.gray, lineWidth: 10))
            }
            .edgesIgnoringSafeArea(.top)
            
            Spacer()
            
            Text("The Trapezium")
                .font(.largeTitle)
                .fontWeight(.bold)

            Spacer()
            
            ZStack {
                TrapeziumShape(offset: 0.65, corner: .topLeft)
                    .fill(Color.green.opacity(0.8))
                    .shadow(radius: 8)
                TrapeziumShape(offset: 0.65, corner: .topRight)
                    .fill(Color.green.opacity(0.5))
                    .shadow(radius: 8)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                TrapeziumShape(offset: 0.5, corner: .bottomRight)
                    .fill(Color.themeAccent)
                    .rotationEffect(.degrees(90))
                    .frame(width: 22, height: 44)
                    .shadow(radius: 2, y: 2)
                    .opacity(show ? 1 : 0)
                    .animation(.default)
            }
            .onAppear(perform: { self.show.toggle() }))
    }
}

struct VideoDemonstration_Previews: PreviewProvider {
    static var previews: some View {
        VideoDemonstration()
    }
}
