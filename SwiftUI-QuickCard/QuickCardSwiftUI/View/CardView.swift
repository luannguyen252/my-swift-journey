//
//  CardView.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 200, alignment: .center)
                .foregroundColor(.orange)
                .shadow(radius: 10)
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title)
                    Text("\(user.title)")
                        .italic()
                    
                    Spacer()
                    
                    ImageLabelView(imageName: "envelope.fill", text: $user.email)
                    
                    ImageLabelView(imageName: "link", text: $user.companyUrl)
                    
                    ImageLabelView(imageName: "location.fill", text:
                                    $user.address)
                    
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
            }
        }.frame(width: 300, height: 200)
        

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: User(firstName: "Umer", lastName: "Khan", title: "Junior Software Engineer", email: "umer@codesorbit.com", companyUrl: "www.codesorbit.com", address: "Industrial Area Islamabad", visit: Visit(views: 22, events: 44, badges: 55, actions: 77, duration: 88)))
    }
}
