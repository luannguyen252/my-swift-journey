//
//  ListCell.swift
//  SearchListSwiftUIExample
//
//  Created by John Codeos on 11/18/20.
//

import SwiftUI

struct ListCell: View {
    var text: String
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                HStack {
                    Text(text)
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Spacer()
        }.background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))).ignoresSafeArea()
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(text: "United States 🇺🇸")
    }
}

