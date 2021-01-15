//
//  SafeAreaExampleView.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct SafeAreaExampleView: View {
    var body: some View {
        Text("Hello World")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SafeAreaExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaExampleView()
    }
}
