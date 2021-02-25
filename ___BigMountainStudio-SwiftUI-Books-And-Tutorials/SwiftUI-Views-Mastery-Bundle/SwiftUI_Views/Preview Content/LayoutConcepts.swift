//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LayoutConcepts: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text("My Blueprint")
                        .font(.largeTitle)
                    Text("Any Text")
                        .font(.title)
                }
                Spacer()
            }
            RoundedRectangle(cornerRadius: 25)
            HStack {
                RoundedRectangle(cornerRadius: 20)
                RoundedRectangle(cornerRadius: 20)
                RoundedRectangle(cornerRadius: 20)
                RoundedRectangle(cornerRadius: 20)
            }
            .frame(height: 100)
            HStack {
                RoundedRectangle(cornerRadius: 20)
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                    RoundedRectangle(cornerRadius: 20)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LayoutConcepts_Previews: PreviewProvider {
    static var previews: some View {
        LayoutConcepts()
    }
}
