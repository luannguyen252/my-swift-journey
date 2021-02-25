//
//  Form_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Form_Intro : View {
    var body: some View {
        Form {
            Section {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content in here")
                Text("The cells will grow to fit the content")
                Text("Remember, it's just views inside of views")
            }
            
            Section {
                Text("Limitations")
                    .font(.title)
                Text("There are built-in margins that are difficult to get around. Take a look at the color below so you can see where the margins are:")
                Color.purple
            }
            
            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
            }
        }
    }
}

struct Form_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Form_Intro()
    }
}
