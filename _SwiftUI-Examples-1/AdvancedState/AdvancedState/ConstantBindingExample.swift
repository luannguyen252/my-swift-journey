//
//  ConstantBindingExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/19.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ConstantBindingExample: View {
    var body: some View {
        Toggle(isOn: .constant(true)) {
            Text("Show advanced options")
        }
    }
}

struct ConstantBindingExample_Previews: PreviewProvider {
    static var previews: some View {
        ConstantBindingExample()
    }
}
