//
//  CourseCardView.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct CourseCardView: View {
    // MARK: - PROPERTIES
    var course: Course
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 0) {
                Image(course.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .background(Color(course.asset))
                HStack() {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(course.name)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("text"))
                        
                        Text("\(course.numCourse) Courses")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color("text")).opacity(0.6)
                    } //: VSTACK
                    Spacer(minLength: 0)
                } //: HSTACK
                .padding()
            } //: VSTACK
            .background(Color.white)
            .cornerRadius(16)
            
            Spacer(minLength: 0)
        } //: VSTACK
        .shadow(color: Color.black.opacity(0.1), radius: 16, x: 4, y: 0)
    }
}
