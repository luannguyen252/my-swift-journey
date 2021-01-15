//
//  CertificatesListView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/30/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CertificatesListView: View {
    @EnvironmentObject var certificatesStore: CertificatesStore
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(certificatesStore.certificates.indexed(), id: \.1.id) { (index, certificate) in
                    CertificateCard(certificate: self.$certificatesStore.certificates[index])
                }
            }
            .padding(20)
            .padding(.leading, 20)
        }
    }
}

struct CertificatesListView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesListView()
            .environmentObject(CertificatesStore())
    }
}
