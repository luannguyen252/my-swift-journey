//
//  PathGraphic.swift
//  Chapter06
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct PathGraphic: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 10, y: 210))
            path.addLine(to: CGPoint(x: 210, y: 210))
            path.addLine(to: CGPoint(x: 210, y: 10))
        }.fill(Color.red)
    }
}

struct PathGraphic_Previews: PreviewProvider {
    static var previews: some View {
        PathGraphic()
    }
}
