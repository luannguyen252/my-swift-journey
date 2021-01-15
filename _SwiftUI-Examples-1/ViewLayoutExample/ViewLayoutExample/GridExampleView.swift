//
//  GridExampleView.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct GridExampleView: View {
    var body: some View {
        GridStack(rows:4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct GridExampleView_Previews: PreviewProvider {
    static var previews: some View {
        GridExampleView()
    }
}
