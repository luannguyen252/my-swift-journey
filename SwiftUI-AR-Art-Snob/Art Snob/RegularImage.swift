//  Created by Cameron  Partee on 12/25/19.
//  Copyright © 2019 Cameron Partee. All rights reserved.

import SwiftUI

struct RegularImage: View {
    var name: String
    var body: some View {
        VStack {
            Image(name)
            .resizable()
            .scaledToFit()
        }
    }
}

struct RegularImage_Previews: PreviewProvider {
    static var previews: some View {
        RegularImage(name: "Alfred Sisley1")
    }
}
