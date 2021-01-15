//
//  HitTestingExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/07.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct HitTestingExample: View {
    var body: some View {
//        상위에 있는 뷰가 이벤트를 막고 있을때, 상위에 있는 뷰의 allowsHitTesting false를 하면
//        responder 체인 이벤트가 하단에 넘겨준다.
        ZStack {
            Button("Tap Me") {
                print("Button was tapped")
            }.frame(width:100, height: 100)
                .background(Color.white)
            
            Rectangle().fill(Color.red.opacity(0.2))
            .frame(width: 300, height: 300)
                .clipShape(Circle())
            .allowsHitTesting(false)
        }
    }
}

struct HitTestingExample_Previews: PreviewProvider {
    static var previews: some View {
        HitTestingExample()
    }
}
