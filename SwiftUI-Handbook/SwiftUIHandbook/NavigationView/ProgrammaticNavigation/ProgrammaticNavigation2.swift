//
//  ProgrammaticNavigation2.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ProgrammaticNavigation2: View {
    // MARK: - PROPERTIES
    @State private var selection: String? = nil
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Second View"), tag: "Second", selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("Third View"), tag: "Third", selection: $selection) { EmptyView() }
                Button("Tap to show second") {
                    self.selection = "Second"
                }
                Button("Tap to show third") {
                    self.selection = "Third"
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

// MARK: - PREVIEW
struct ProgrammaticNavigation2_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticNavigation2()
    }
}
