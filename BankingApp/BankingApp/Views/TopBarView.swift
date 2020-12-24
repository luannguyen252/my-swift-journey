//
//  TopBarView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopBarView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                print("Button Pressed!")
            }, label: {
//                Image(systemName: "line.horizontal.3")
//                    .font(.title2)
//                    .padding(.all, 16)
                Image(uiImage: #imageLiteral(resourceName: "profile"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 8)
            
            Text("Luan Nguyen")
                .kerning(1.0)
                .font(.system(size: 16))
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .padding(.all, 16)
            })
        } //: HSTACK
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
#endif
