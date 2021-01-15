//
//  CertificatesStore.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/30/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Combine


final class CertificatesStore: ObservableObject {
    
    static var defaultCertificates = [
        Certificate(
            title: "Build an App with SwiftUI",
            imageName: "Illustration1"
        ),
        Certificate(
            title: "Certificate 2",
            imageName: "Illustration2"
        ),
        Certificate(
            title: "Certificate 3",
            imageName: "Illustration3"
        ),
        Certificate(
            title: "Course 4",
            imageName: "Illustration4"
        ),
    ]
    
    @Published var certificates: [Certificate]
    
    init(certificates: [Certificate] = CertificatesStore.defaultCertificates) {
        self.certificates = certificates
    }
}
