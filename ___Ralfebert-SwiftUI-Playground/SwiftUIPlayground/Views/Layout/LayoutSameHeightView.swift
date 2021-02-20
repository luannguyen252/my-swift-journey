// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

// https://stackoverflow.com/questions/61905699/how-to-make-subview-fit-all-available-vertical-space-in-hstack
struct LayoutSameHeightView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Image("cookies")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Lorem Ipsum Lorem Ipsum Lorem Ipsum")

            }
            .frame(maxHeight: .infinity, alignment: .center) // << here !!
            .background(Color.blue)
            VStack {
                Image("turtlerock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Hello")
            }
            .frame(maxHeight: .infinity, alignment: .center) // << here !!
            .background(Color.red)
        }
        .fixedSize(horizontal: false, vertical: true) // << here !!
    }
}

struct LayoutSameHeightView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutSameHeightView()
    }
}
