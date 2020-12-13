//
//  Course.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

// MARK: - COURSE DATA MODEL
struct Course: Identifiable {
    var id = UUID().uuidString
    var name: String
    var numCourse: Int
    var asset: String
}

// MARK: - COURSE DATA
var courses = [
    Course(name: "HTML/CSS", numCourse: 7, asset: "html_css"),
    Course(name: "JavaScript", numCourse: 8, asset: "javascript"),
    Course(name: "NodeJS", numCourse: 9, asset: "nodejs"),
    Course(name: "React", numCourse: 10, asset: "react"),
    Course(name: "React Native", numCourse: 11, asset: "react_native"),
    Course(name: "SwiftUI", numCourse: 12, asset: "swiftui"),
    Course(name: "Kotlin", numCourse: 13, asset: "kotlin"),
    Course(name: "UX", numCourse: 14, asset: "ux"),
    Course(name: "UI", numCourse: 15, asset: "ui"),
    Course(name: "Design System", numCourse: 16, asset: "design_system")
]
