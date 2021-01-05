//
//  WelcomeView.swift
//  Apple news
//
//  Created by Nicolas Rios on 12/14/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack (alignment:.center) {
            Text("Welcome to")
                .font(.system(size: 54))
                .fontWeight(.black)
                .foregroundColor(.pink)
                .padding(.bottom, -24)
            
            Text("Apple News")
                .font(.system(size: 54))
                .fontWeight(.black)
                .foregroundColor(.pink)
                .padding(.bottom, 4)
            
            Text("The Best of Stories from the Source")
                .font(.system(size: 22))
                .lineLimit(2)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
