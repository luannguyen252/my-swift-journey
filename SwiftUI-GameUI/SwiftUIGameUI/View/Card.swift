//
//  Card.swift
//  SwiftUIGameUI
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Card: View {
    var data: Player
    
    var body: some View {
        HStack {
            Image(self.data.image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack(spacing: 20) {
                Spacer(minLength: 0)
                
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                
                        ZStack {
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[0])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[1])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "hammer.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[2])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                NavigationLink(destination: Detail(data: self.data)) {
                    Text("See Details")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                        
                }
                .offset(y: -35)
            }
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
            .cornerRadius(25)
            // Going to rate view in 3d angle...
            .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
            // Going to trim view..
            .padding(.vertical, 35)
            .padding(.trailing, 25)
            
        )
        .padding(.horizontal)
    }
}
