//
//  Detail.swift
//  SwiftUIGameUI
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Detail: View {
    var data: Player
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        self.present.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Button Pressed!")
                    }) {
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                
                Text("Overview")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            Image(self.data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(self.data.name)
                .fontWeight(.bold)
                .font(.system(size: 55))
                .foregroundColor(.white)
                .padding(.top)
            
            Text("Super smash bros ultimate\ncillagers from the animal crossing series.\nThis troops fight most effictively in large group.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top)
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Button Pressed!")
                }) {
                    Text("Add Favourite")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                }
                
                Button(action: {
                    print("Button Pressed!")
                }) {
                    Text("Play Now")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(Color("Color4"))
                        .clipShape(Capsule())
                }
            }
            .padding(.top,30)
            
            Spacer()
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
