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
                Image(systemName: "line.horizontal.3")
                    .padding(.all, 20)
            })
            
            Text("HOME")
                .kerning(2.0)
                .bold()
            
            Spacer()
            
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "magnifyingglass")
                    .padding(.all, 20)
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
