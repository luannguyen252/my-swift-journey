//
//  BasicList.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct BasicList: View {
    // MARK: - PROPERTIES
    let disciplines = ["statue", "mural", "plaque", "statue"]
    
    // MARK: - BODY
    var body: some View {
        List(disciplines, id: \.self) { discipline in
          Text(discipline)
        }
    }
}

// MARK: - PREVIEW
struct BasicList_Previews: PreviewProvider {
    static var previews: some View {
        BasicList()
    }
}
