//
//  ContentView.swift
//  SwiftUIDragExamples
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import SwiftUIDrag

struct ContentView: View {
    var body: some View {
        SDView(floating: .leading, collapse: .trailing) { geo, state in
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(width: geo.size.width / 2, height: geo.size.height / 4)
                .overlay(
                    HStack {
                        Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .frame(width: 10, height: 20)
                        .opacity(state.isCollapsed && state.isTrailing ? 1 : 0)
                        .padding(.leading)
                        
                        Spacer()
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
