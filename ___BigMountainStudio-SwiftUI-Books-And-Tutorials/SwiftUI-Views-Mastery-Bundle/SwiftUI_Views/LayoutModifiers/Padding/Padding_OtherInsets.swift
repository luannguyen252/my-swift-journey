//
//  Padding_OtherInsets.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_OtherInsets: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Padding").font(.largeTitle)
            Text("Other Insets").foregroundColor(.gray)
            Text("Here are more examples of inset options available to you.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .layoutPriority(2)
                .foregroundColor(.white)
            
            HStack(spacing: 80) {
                VStack {
                    Text("Leading")
                    Image("profile")
                        .padding(.leading)
                        .border(Color("Theme4ForegroundColor"))
                }
                VStack {
                    Text("Top")
                    Image("profile")
                        .padding(.top)
                        .border(Color("Theme4ForegroundColor"))
                }
            }
            
            HStack(spacing: 80) {
                VStack {
                    Text("Trailing")
                    Image("profile")
                        .padding(.trailing)
                        .border(Color("Theme4ForegroundColor"))
                }
                VStack {
                    Text("Botton")
                    Image("profile")
                        .padding(.bottom)
                        .border(Color("Theme4ForegroundColor"))
                }
            }
            
            HStack(spacing: 30) {
                VStack {
                    Text("Top Trailing")
                    Image("profile")
                        .padding([.top, .trailing])
                        .border(Color("Theme4ForegroundColor"))
                }
                VStack {
                    Text("Leading Botton")
                    Image("profile")
                        .padding([.leading, .bottom])
                        .border(Color("Theme4ForegroundColor"))
                }
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Padding_OtherInsets_Previews: PreviewProvider {
    static var previews: some View {
        Padding_OtherInsets()
    }
}
