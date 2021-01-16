//
//  Contact.swift
//  MyContacts
//
//  Created by Andreas Schultz on 08.10.20.
//

import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let phone: String
    let email: String
    let address: String
}

let contacts = [
    Contact(imageName: "hollyHuey", name: "Holly F. Huey", phone: "+1(242)-8110134", email: "hollyhuey@yeilmail.com", address: "242 Wildrose River 16040 Louisiana"),
    Contact(imageName: "roseAcker", name: "Rose Acker", phone: "+1(656)-1881047", email: "roseacker@neymail.com", address: "249 Modoc Half 75290 Michigan"),
    Contact(imageName: "leonardoLongNecker", name: "Leonardo Longnecker", phone: "+1(545)-3442899", email: "cbleonardo1@zuimail.com", address: "952 Baker Haggerty 90562 Missouri"),
    Contact(imageName: "quentinJoplin", name: "Quentin F. Joplin", phone: "+1(434)-7448466", email: "cfjoplin5@neymail.com", address: "176 Flanigan Road 49223 Mississippi"),
    Contact(imageName: "christineClapper", name: "Christine Clapper", phone: "+1(141)-5115553", email: "dachristine0@vuomail.com", address: "635 Prospect River 58641 Kansas"),
    Contact(imageName: "joyCordon", name: "Joy Cordon", phone: "+1(353)-0663954", email: "bvjoy21@ypmail.com", address: "763 University Trail 81701 Wisconsin")
]
