//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import Foundation

final class PeopleViewModel: ObservableObject {
    struct Person: Identifiable {
        var id = UUID()
        var name: String
        var twitterHandle: String
    }
    
    @Published var people = [Person(name: "Mark Moeykens", twitterHandle: "@BigMtnStudio")]
}
