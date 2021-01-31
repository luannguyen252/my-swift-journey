//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct CurvedSideRectangleClipMe: View {
    private let lg = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.737254902, green: 0.4549019608, blue: 0.1529411765, alpha: 1)), Color(#colorLiteral(red: 0.1983170007, green: 0.09270514631, blue: 0.07213870882, alpha: 1))]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40.0) {
                Image("vishnu.r.nair")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(CurvedSideRectangle(bottomOffset: 40))
                    .shadow(radius: 5, y: 5)
                    .overlay(
                        Text("PARTY")
                            .font(Font.system(size: 80))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .opacity(0.7))
                
                VStack(spacing: 20.0) {
                    Text("The curved side rectangle is a shape which means you can use it as a mask on images using the clipShape modifier. We had to work to keep the whole shape within its frame so the masking worked right.")
                    
                    Spacer()
                    
                    Text("More Options!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("The shape was further modified to curve on the top too 👇")
                }
                .padding(.horizontal)
                
                Spacer()
                
                CurvedSideRectangle(topOffset: -40, bottomOffset: 0)
                    .fill(lg)
                    .frame(height: 80.0)
                    .shadow(radius: 5, y: -5)
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct CurvedSideRectangleClipMe_Previews: PreviewProvider {
    static var previews: some View {
        CurvedSideRectangleClipMe()
    }
}
