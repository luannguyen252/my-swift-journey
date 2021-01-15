//
//  SizeClassesExample.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/04/30.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI


struct SizeClassesExample: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
//    화면 전환 사이즈 체크
    var body: some View {
        if horizontalSizeClass == .compact {
            return Text("Compact")
        } else {
            return Text("Regular")
        }
    }
    
}
struct SizeClassesExample_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassesExample()
    }
}
