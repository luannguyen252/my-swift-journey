//
//  MyDebugView.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct MyDebugView: View {
    @State private var toggleValue = false
    
    var body: some View {
        Toggle(isOn: $toggleValue){
            Text("Toggle a value")
        }
        .debugPrint(toggleValue)
        .comment("This is just a comment")
    }
}

struct MyDebugView_Previews: PreviewProvider {
    static var previews: some View {
        MyDebugView()
    }
}
