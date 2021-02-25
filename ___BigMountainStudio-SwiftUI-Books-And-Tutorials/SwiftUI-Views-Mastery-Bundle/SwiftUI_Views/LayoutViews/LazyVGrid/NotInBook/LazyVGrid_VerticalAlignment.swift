//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVGrid_VerticalAlignment: View {
    @State private var people = Data.getProfiles()
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView("LazyVGrid",
                       subtitle: "Adaptive with Vertical Alignment",
                       desc: "Here's an example of vertical alignment inside each grid item. I'm using a Spacer push content to the top, inside the grid item.")
            
            let columns = [GridItem(.adaptive(minimum: 150, maximum: 200))]
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(people) { person in
                        VStack {
                            Image(person.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            Text(person.name)
                            
                            Spacer()
                        }
                    }
                    Image(systemName: "arrow.down.circle")
                }
                .padding(.bottom)
            }
        }
        .font(.title)
    }
}

struct LazyVGrid_VerticalAlignment_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_VerticalAlignment()
    }
}
