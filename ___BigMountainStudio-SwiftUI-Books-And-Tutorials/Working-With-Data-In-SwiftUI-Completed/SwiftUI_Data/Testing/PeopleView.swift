//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct PeopleView: View {
    
    @ObservedObject var viewModel = PeopleViewModel()
    
    var body: some View {
        List(viewModel.people) { person in
            VStack(alignment: .leading, spacing: 10) {
                Text(person.name)
                Text(person.twitterHandle)
                    .font(.caption)
            }
            .padding()
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
