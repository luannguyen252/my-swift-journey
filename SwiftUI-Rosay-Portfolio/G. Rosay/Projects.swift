//
//  Projects.swift
//  G. Rosay
//
//  Created by Gaspard Rosay on 06.10.19.
//  Copyright © 2019 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct Project : Identifiable{
    var id = UUID()
    var imageName: String
    var name: String
    var subtitle: String
    var year: String
    var desc: String
    
    var gImageName:String { return imageName }
    var gName:String { return name }
    var gSubtitle:String { return subtitle }
    var gYear:String { return year }
    var gDesc:String { return desc }
}

let projectsData = [
    Project(imageName: "wheretobio", name: NSLocalizedString("wheretobio_title", comment: ""), subtitle: NSLocalizedString("wheretobio_subtitle", comment: ""), year: "2020", desc: NSLocalizedString("wheretobio_desc", comment: "")),
    Project(imageName: "toa", name: NSLocalizedString("toa_title", comment: ""), subtitle: NSLocalizedString("toa_subtitle", comment: ""), year: "2019", desc: NSLocalizedString("toa_desc", comment: "")),
    Project(imageName: "flyflap", name: NSLocalizedString("flyflap_title", comment: ""), subtitle: NSLocalizedString("flyflap_subtitle", comment: ""), year: "2019", desc: NSLocalizedString("flyflap_desc", comment: "")),
    Project(imageName: "flynyan", name: NSLocalizedString("flynyan_title", comment: ""), subtitle: NSLocalizedString("flynyan_subtitle", comment: ""), year: "2011", desc: NSLocalizedString("flynyan_desc", comment: "")),
    Project(imageName: "phphalo", name: NSLocalizedString("phphalo_title", comment: ""), subtitle: NSLocalizedString("phphalo_subtitle", comment: ""), year: "2015-2019", desc: NSLocalizedString("phphalo_desc", comment: ""))
]
