//
//  PostView.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct PostView: View {
    var image: String
    var body: some View {
        
        GeometryReader { reader in
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: reader.frame(in: .global).width, height: 250)
                    .cornerRadius(8)
                
                HStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Circle().stroke(gradient, lineWidth: 2))
                        .clipShape(Circle())
                    
                    Text("Luan Nguyen")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Spacer(minLength: 0)

                    Button(action: {
                        print("Button Pressed!")
                    }, label: {
                        Label(
                            title: { Text("1.5K") },
                            icon: { Image(systemName: "suit.heart.fill") })
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        print("Button Pressed!")
                    }, label: {
                        Label(
                            title: { Text("555") },
                            icon: { Image(systemName: "message.fill") })
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal)
                .foregroundColor(.gray)
            }
        }
        .frame(height: 300)
    }
}

#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
