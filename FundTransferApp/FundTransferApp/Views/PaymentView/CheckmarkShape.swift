//
//  CheckmarkShape.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CheckmarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 25, y: 50))
            path.addLine(to: CGPoint(x: 25, y: 50))
            path.addLine(to: CGPoint(x: 40, y: 65))
            path.addLine(to: CGPoint(x: 70, y: 35))
        }
    }
}
