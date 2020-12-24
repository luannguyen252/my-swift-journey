//
//  BasicNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct BasicNavigationView: View {
    // MARK: - BODY
    var body: some View {
        // 1. Navigation Inline
        NavigationView {
            Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
                .navigationBarTitle("Navigation Title", displayMode: .inline)
        }
        
        // 2. Navigation Automatic
        NavigationView {
            Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
                .navigationBarTitle("Navigation Title", displayMode: .automatic)
        }
        
        // 3. Navigation Large
        NavigationView {
            Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.")
                .navigationBarTitle("Navigation Title", displayMode: .large)
        }
    }
}

// MARK: - PREVIEW
struct BasicNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BasicNavigationView()
    }
}
