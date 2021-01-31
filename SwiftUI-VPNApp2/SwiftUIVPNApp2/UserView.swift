//
//  UserView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                print("Button Pressed!")
            } label: {
                Image(uiImage: #imageLiteral(resourceName: "profile"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .cornerRadius(24)
            }

            Text("Hello,")
                .font(.title3)
                .fontWeight(.regular)
            Text("Luan Nguyen")
                .font(.title)
                .fontWeight(.heavy)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
