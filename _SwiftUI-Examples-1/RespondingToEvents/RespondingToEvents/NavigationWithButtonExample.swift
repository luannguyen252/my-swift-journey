//
//  NavigationWithButtonExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct NavigationWithButtonExample: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Detail view here")) {
                Image(systemName: "arkit")
                .renderingMode(.original)

            }
//            .buttonStyle(PlainButtonStyle())
        }
//        Button(action: {
//        }) {
//            Image(systemName: "arkit")
//        }
//        .buttonStyle(PlainButtonStyle())
    }
}

struct NavigationWithButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWithButtonExample()
    }
}
