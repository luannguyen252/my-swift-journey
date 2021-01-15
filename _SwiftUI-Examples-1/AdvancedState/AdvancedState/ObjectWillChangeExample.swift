//
//  ObjectWillChangeExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/12.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ObjectWillChangeExample: View {
    @ObservedObject var settings = UserAuthentication()
    
    var body: some View {
        VStack {
            TextField("Username", text:$settings.username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Your username is : \(settings.username)")
        }
    }
}

struct ObjectWillChangeExample_Previews: PreviewProvider {
    static var previews: some View {
        ObjectWillChangeExample()
    }
}
