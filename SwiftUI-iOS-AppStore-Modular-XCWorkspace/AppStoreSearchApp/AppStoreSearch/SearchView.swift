//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by Arifin Firdaus on 06/10/20.
//  Copyright © 2020 Arifin Firdaus. All rights reserved.
//

import SwiftUI

public struct SearchView: View {
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            Text("SearchView")
                .navigationBarTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
