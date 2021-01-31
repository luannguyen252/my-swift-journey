//
//  Button.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - GHOST BUTTON
            Button(action: {
                print("Ghost Button")
            }) {
                Text("Ghost Button")
                    .foregroundColor(.pink)
                    .padding(16)
            }
            
            // MARK: - OUTLINE BUTTON
            Button(action: {
                print("Outline Button")
            }) {
                Text("Outline Button")
                    .foregroundColor(.pink)
                    .padding(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8).stroke(Color.pink, lineWidth: 1)
                    )
            }
            
            // MARK: - SOLID BUTTON
            Button(action: {
                print("Solid Button")
            }) {
                Text("Solid Button")
                    .foregroundColor(.white)
                    .padding(16)
                    .background(Color.pink)
                    .cornerRadius(8)
            }
            
            // MARK: - ICON BUTTON
            Button(action: {
                print("Icon Button")
            }) {
                HStack {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.pink)
                    Text("Icon Button")
                        .foregroundColor(.pink)
                }
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.pink, lineWidth: 1)
                )
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
