//
//  DetailView.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    var course: Course
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text(course.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("text"))
        } //: VSTACK
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image("menu")
                .renderingMode(.template)
                .foregroundColor(Color("text")).opacity(0.4)
        }))
    }
}
