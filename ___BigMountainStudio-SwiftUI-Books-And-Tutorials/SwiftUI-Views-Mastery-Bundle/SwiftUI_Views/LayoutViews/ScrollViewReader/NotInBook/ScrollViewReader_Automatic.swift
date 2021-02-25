//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ScrollViewReader_Automatic: View {
    @State private var people = Data.getProfiles()
    @State private var index = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 5) {
                        ForEach(people) { person in
                            Image("\(person.imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 380)
                                .padding()
                                .id(person.id) // Give every view an ID so you can use ScrollViewReader to scroll to it.
                        }
                    }
                }
                .disabled(true) // disables scrolling
                
                
                // These buttons HAVE to be inside the ScrollViewReader so you can use the .scrollTo function
                HStack {
                    Button("Previous") {
                        index -= 1
                        withAnimation {
                            // Scroll to the previous view in the ScrollView
                            scrollViewProxy.scrollTo(people[index].id)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button("Next") {
                        index += 1
                        withAnimation {
                            // Scroll to the next view in the ScrollView
                            scrollViewProxy.scrollTo(people[index].id)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct ScrollViewReader_Automatic_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader_Automatic()
    }
}
