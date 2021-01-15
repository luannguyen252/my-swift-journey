//
//  SkillDescription.swift
//  G. Rosay
//
//  Created by Gaspard Rosay on 06.10.19.
//  Copyright © 2019 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct SkillDescription: View {
    let skill: Skill
    var body: some View {
        VStack{
            Image(systemName: skill.icon)
                .font(.system(size:130))
                .padding(.bottom, 50.0)
            Text(skill.desc)
                .frame(width:350)
                .fixedSize(horizontal: false, vertical:true)
         }
        .navigationBarTitle(Text(skill.name), displayMode: .inline)
    }
}

struct SkillDescription_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ SkillDescription(skill: skillsData[0]) }
    }
}
