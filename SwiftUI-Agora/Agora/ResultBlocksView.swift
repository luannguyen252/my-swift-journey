//
//  ResultBlocksView.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 29/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct ResultBlocksView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: -3)
                .foregroundColor(.red)
            VStack{
                HStack {
                    Text("Election 00")
                        .font(.subheadline)
                        .padding(.trailing,-5)
                        .foregroundColor(.white)
                    Text("/ n+ voters")
                        .font(.footnote)
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.leading,7)
                Text("Description:lorem Ipsum is simply dummy text of the printing and typesetting industry.lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.leading,7)
                    .frame(height: 50.0)
                Spacer()
                HStack{
                    Image("lakemcdonald")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 1))
                        .blur(radius: 0.5).padding(.leading, 8)
                    Image("lakemcdonald")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 1))
                    .blur(radius: 0.5)
                    Image("lakemcdonald")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 1))
                    .blur(radius: 0.5)
                    Spacer()
                }
            }.background(Color.green)
        }.background(Color.yellow)
    }
}

struct ResultBlocksView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBlocksView()
            .previewLayout(.fixed(width: 240, height: 104))
    }
}

