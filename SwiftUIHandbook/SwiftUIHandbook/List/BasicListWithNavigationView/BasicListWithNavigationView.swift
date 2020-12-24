//
//  BasicListWithNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct BasicListWithNavigationView: View {
    // MARK: - PROPERTIES
    let disciplines = ["statue", "mural", "plaque", "statue"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
          List(disciplines, id: \.self) { discipline in
            NavigationLink(
                destination: DetailView_BasicListWithNavigationView(discipline: discipline)) {
                  Text(discipline)
              }
          }
          .navigationBarTitle("Disciplines")
        }
    }
}

// MARK: - PREVIEW
struct BasicListWithNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BasicListWithNavigationView()
    }
}
