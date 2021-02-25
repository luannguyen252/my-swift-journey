//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Relationships_AndModifiers: View {
    var body: some View {
        VStack {
            Text("Parent")
                .font(.system(size: 50))
                .bold()
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
                .overlay(Text("Child"))
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
                .overlay(Text("Child"))
        }
        .font(.system(size: 30))
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: 10))
        .padding()
        .padding(.vertical, 200)
    }
}

struct Relationships_AndModifiers_Previews: PreviewProvider {
    static var previews: some View {
        Relationships_AndModifiers()
    }
}
