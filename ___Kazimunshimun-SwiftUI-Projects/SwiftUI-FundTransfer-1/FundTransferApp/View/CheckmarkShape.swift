//
//  CheckmarkShape.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
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
