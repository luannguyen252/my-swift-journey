//
//  SearchandProfileView.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 29/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct SearchandProfileView: View {
    @State var search : String = ""
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                TextField("", text:$search)
                    .background(Color.gray)
                    .foregroundColor(Color.purple)
                    .cornerRadius(13)
                HStack {
                    Text("Search")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                }
            }
    
            Spacer()
            
            Image("lakemcdonald")
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .shadow(radius: 5)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 1))
                .blur(radius: 0.5)
        }.padding()
            .background(Color.green)
    }
}

struct SearchandProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SearchandProfileView()
            .previewLayout(.fixed(width: 317, height: 45))
    }
}
