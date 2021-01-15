//
//  HouseSwornMembersView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseSwornMembersView: View {
    let swornMembers: [URL]

    var body: some View {
        ForEach(swornMembers, id: \.self) { swornMember in
            Link(destination: swornMember) {
                Text(swornMember.absoluteString)
            }
        }
    }
}

#if DEBUG
struct HouseSwornMembersView_Previews: PreviewProvider {
    static var previews: some View {
        HouseSwornMembersView(swornMembers: [])
    }
}
#endif
