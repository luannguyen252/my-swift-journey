//
//  ElectionViewModule.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 30/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct ElectionViewModule: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .shadow(radius: 5)
            VStack{
                HStack{
                    Image(systemName: "clock")
                        .frame(width: 14, height: 11)
                    Text("Start -End/Time")
                        .font(.footnote)
                    Spacer()
                }.foregroundColor(.green)
                    .padding(.leading)
                HStack {
                    Text("Election Name")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.leading)
                    .padding(.bottom,3)
                Text("Description:lorem Ipsum is simply dummy text of the printing and typesetting industry.lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding(.leading,7)
                    .frame(height: 50.0)
                    .foregroundColor(.gray)
                HStack {
                    Image("lakemcdonald")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 1))
                        .blur(radius: 0.5).padding(.leading, 8)
                        .padding(.leading,7)
                    Text("Created By")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .frame(width: 340, height: 189)
        }

    }
}

struct ElectionViewModule_Previews: PreviewProvider {
    static var previews: some View {
        ElectionViewModule()
            .previewLayout(.fixed(width: 336, height: 189))
    }
}
