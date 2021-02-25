//
//  MenuHeaderView.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import SwiftUI

struct MenuHeaderView: View {
    let title: String
    let imageName: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24))
                .bold()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: imageName)
                    .padding(.all, 20)
            })
        }
        .foregroundColor(.white)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
