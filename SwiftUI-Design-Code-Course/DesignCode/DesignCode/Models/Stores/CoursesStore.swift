//
//  CoursesStore.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/23/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


final class CoursesStore: ObservableObject {
    
    static var defaultCourses = [
        Course(
            title: "Build an App with SwiftUI",
            imageName: "Illustration1",
            backgroundColor: Color("background3"),
            shadowColor: Color("Background3Shadow")
        ),
        Course(
            title: "Course 2",
            imageName: "Illustration2",
            backgroundColor: Color("background4"),
            shadowColor: Color("Background4Shadow")
        ),
        Course(
            title: "Course 3",
            imageName: "Illustration3",
            backgroundColor: Color("background3"),
            shadowColor: Color("Background3Shadow")
        ),
        Course(
            title: "Course 4",
            imageName: "Illustration4",
            backgroundColor: Color("background4"),
            shadowColor: Color("Background4Shadow")
        ),
    ]
    
    @Published var courses: [Course]
    
    init(courses: [Course] = CoursesStore.defaultCourses) {
        self.courses = courses
    }
}

