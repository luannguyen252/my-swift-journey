//
//  MenuItemView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct MenuItemView: View {
    let imageName: String
    let title: String
    var didEntered: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: didEntered ? 2.0 : 0.0) // to show user that drag user entered the menu
                )
            
            VStack(alignment: .leading) {
                ZStack {
                    Circle()
                        .fill(Color.logoLinear)
                        .frame(width: 45, height: 45)
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                }
                
                Text(title)
            }
            .padding(.horizontal)
        }
    }
}
