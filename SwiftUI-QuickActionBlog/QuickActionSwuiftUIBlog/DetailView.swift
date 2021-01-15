//
//  DetailView.swift
//  QuickActionSwuiftUIBlog
//
//  Created by Thomas Prezioso on 11/3/20.
//

import SwiftUI

struct DetailView: View {
    var name: String
    
    var body: some View {
        Text("\(name)!")
            .navigationBarTitle(name)
    }
}
