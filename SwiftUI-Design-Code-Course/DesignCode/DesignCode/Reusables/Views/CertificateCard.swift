//
//  CertificateCard.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CertificateCard: View {
    static var defaultCardSize = CGSize(width: 340, height: 220)
    
    var cardSize: CGSize = Self.defaultCardSize

    
    @Binding var certificate: Certificate
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    
                    Text("Certificate")
                        .foregroundColor(Color.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image("Background")
        }
        .frame(width: cardSize.width, height: cardSize.height)
        .background(Color.black)
        .cornerRadius(18)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
}

struct CertificateCard_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCard(certificate: .constant(CertificatesStore.defaultCertificates[0]))
    }
}
