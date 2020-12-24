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
                .font(.system(size: 24))
                .bold()
            
            Spacer()
            
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: imageName)
                    .padding(.all, 20)
            })
        } //: HSTACK
        .foregroundColor(.white)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
