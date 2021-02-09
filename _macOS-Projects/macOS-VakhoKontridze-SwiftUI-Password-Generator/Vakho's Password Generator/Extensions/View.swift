//
//  View.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 9/14/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        frame(width: size.width, height: size.height, alignment: alignment)
    }
}
