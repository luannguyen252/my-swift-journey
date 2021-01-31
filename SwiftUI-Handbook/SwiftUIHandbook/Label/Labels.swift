//
//  Labels.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct Labels: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label {
                Text("Home")
                    .font(.title3)
            } icon: {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .foregroundColor(.red)
            }
            
            Label {
                Text("Recents")
                    .font(.title3)
            } icon: {
                Image(systemName: "clock.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            }
            
            Label {
                Text("Settings")
                    .font(.title3)
            } icon: {
                Image(systemName: "gearshape.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        Labels()
    }
}
