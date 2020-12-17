//
//  MenuView.swift
//  SideMenuHamburgerMenu
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct MenuView: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 100)
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            } //: HSTACK
            .padding(.top, 30)
            Spacer()
        } //: VSTACK
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
