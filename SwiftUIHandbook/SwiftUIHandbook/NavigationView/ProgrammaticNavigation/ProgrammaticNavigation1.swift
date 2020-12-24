//
//  NavigationViewProgrammaticNavigation.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ProgrammaticNavigation1: View {
    // MARK: - PROPERTIES
    @State private var isShowingDetailView = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
                Button("Tap to show detail") {
                    self.isShowingDetailView = true
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

// MARK: - PREVIEW
struct ProgrammaticNavigation1_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticNavigation1()
    }
}
