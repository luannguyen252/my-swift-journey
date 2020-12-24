//
//  MenuItemView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct MenuItemView: View {
    // MARK: - PROPERTIES
    let imageName: String
    let title: String
    var didEntered: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: didEntered ? 2.0 : 0.0) // To show user that drag user entered the menu
                )
            
            VStack(alignment: .leading) {
                ZStack {
                    Circle()
                        .fill(Color.logoLinear)
                        .frame(width: 45, height: 45)
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                } //: ZSTACK
                
                Text(title)
            } //: VSTACK
            .padding(.horizontal)
        } //: ZSTACK
    }
}
