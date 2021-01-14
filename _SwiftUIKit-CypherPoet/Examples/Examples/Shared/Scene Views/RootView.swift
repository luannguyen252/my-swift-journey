//
//  RootView.swift
//  Shared
//
//  Created by CypherPoet on 8/19/20.
//

import SwiftUI


struct RootView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ReduxDataFlowExamples()) {
                    Text("Redux Data Flow Utils")
                }
                NavigationLink(destination: PreviewUtilsExamples()) {
                    Text("Preview Utils")
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
