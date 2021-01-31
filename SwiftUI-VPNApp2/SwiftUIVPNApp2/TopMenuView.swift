//
//  TopMenuView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct TopMenuView: View {
    @Binding var showSideMenu: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                showSideMenu = true
            }, label: {
                Image(systemName: "line.horizontal.3.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                
                HStack(spacing: 0) {
                    Text("VPN")
                        .font(.system(size: 24, weight: .black))
                    
                    Text("Fast")
                        .font(.system(size: 24, weight: .regular))
                }
            })
            
            Spacer()
            
            PremiumView()
        }
    }
}
