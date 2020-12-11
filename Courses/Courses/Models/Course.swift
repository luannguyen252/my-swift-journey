//
//  Course.swift
//  Courses
//
//  Created by Luan Nguyen on 11/12/2020.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var date: String
    var iconColor: String
    var cardColor: String
    
}

struct CourseList : Identifiable {
    var id = UUID()
    var name: String
    var timing: String
    var icon: String
    var iconColor: String
}

var cData = [
    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
]

var lData = [
    CourseList(name: "Lecture 1", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CourseList(name: "Lecture 2", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
    CourseList(name: "Lecture 3", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CourseList(name: "Lecture 4", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
    CourseList(name: "Lecture 5", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CourseList(name: "Lecture 6", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
]
