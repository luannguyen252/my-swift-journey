//
//  MenuHeaderView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct MenuHeaderView: View {
    // MARK: - PROPERTIES
    let title: String
    let imageName: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .kerning(1.5)
                .font(.system(size: 24))
                .fontWeight(.heavy)
            
            Spacer()
            
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: imageName)
                    .font(.title2)
                    .padding(.all, 16)
            })
        } //: HSTACK
        .foregroundColor(.white)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}
