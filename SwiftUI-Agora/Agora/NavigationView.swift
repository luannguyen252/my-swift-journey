//
//  NavigationView.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 29/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
            VStack {
                Spacer()
                Spacer()
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 45, height: 45)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                }.padding(.top,-35)
                HStack{
                    Spacer()
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 30, height: 28)
                    Spacer()
                    Spacer()
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 30, height: 28)
                    Spacer()
                }
                Spacer()
                Spacer()
            }.background(Color.gray)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
            .previewLayout(.fixed(width: 375, height:  100))
    }
}
