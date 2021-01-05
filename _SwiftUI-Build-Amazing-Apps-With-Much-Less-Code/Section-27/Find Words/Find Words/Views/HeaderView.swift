//
//  HeaderView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/8/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - PROPERTIES
    
    @Binding var showSettingsView: Bool
    //haptic feedback
    var hapticImpact = UIImpactFeedbackGenerator(style: .soft)
    
    var body: some View {
        HStack {
            //this image is just used as a spacer so its color is set to clear
            Image(systemName: "info.circle")
            .font(.system(size: 30, weight: .medium))
            .padding(.horizontal, 10)
                .foregroundColor(Color.clear)
            
            Image("title").resizable()
                .frame(width: 250, height: 50)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            //info button
            Button(action: {
                self.hapticImpact.impactOccurred()
                self.showSettingsView.toggle()
            }){
                Image(systemName: "info.circle")
                .font(.system(size: 30, weight: .medium))
                .padding(.top, 10)
                .padding(.horizontal, 10)
            }
        }.accentColor(Color.primary)
        .sheet(isPresented: $showSettingsView) {
                //show the settings view
                SettingsView()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showSettingsView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
