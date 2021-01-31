//
//  ProgrammaticNavigation3.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ProgrammaticNavigation3: View {
    // MARK: - PROPERTIES
    @State private var isShowingDetailView = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) {
                Text("Show Detail")
            }
            .navigationBarTitle("Navigation")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isShowingDetailView = false
            }
        }
    }
}

// MARK: - PREVIEW
struct ProgrammaticNavigation3_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticNavigation3()
    }
}
