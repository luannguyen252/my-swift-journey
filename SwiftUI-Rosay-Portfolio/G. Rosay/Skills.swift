//
//  Skills.swift
//  G. Rosay
//
//  Created by Gaspard Rosay on 06.10.19.
//  Copyright © 2019 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct Skill : Identifiable{
    var id = UUID()
    var icon: String
    var name: String
    var desc: String
    
    var skillIcon:String { return icon }
    var skillName:String { return name }
    var skillDesc:String { return desc }
}

let skillsData = [
    Skill(icon: "phone", name: NSLocalizedString("mobile", comment: "mobile"), desc: NSLocalizedString("mobile_desc", comment: "mobile desc")),
    Skill(icon: "desktopcomputer", name: NSLocalizedString("web_fs", comment: "web fs"), desc: NSLocalizedString("web_fs_desc", comment: "web fs desc")),
    Skill(icon: "gamecontroller", name: NSLocalizedString("game", comment: "game"), desc: NSLocalizedString("game_desc", comment: "game desc"))
]
