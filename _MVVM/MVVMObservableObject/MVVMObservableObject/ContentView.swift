//
//  ContentView.swift
//  MVVMObservableObject
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

// Call API
let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

// Model
struct Course: Identifiable, Decodable {
    var id = UUID()
    let name: String
}

// ViewModel
class CoursesViewModel: ObservableObject {
    @Published var messages = "MESSAGES INSIDE OBSERVABLE OBJECT"
    @Published var courses: [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3")
    ]
    
    // Function inside ViewModel
    func changeMessage() {
        self.messages = "CHANGE MESSAGES INSIDE VIEWMODEL"
    }
    
    // Fetch data from API
    func fetchCourses() {
        // Fetch JSON and decode and update some array property
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            // Make sure to check error or response
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }
        .resume()
    }
}

// View
struct ContentView: View {
    // View calling data from ViewModel
    @ObservedObject var coursesViewModel = CoursesViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                // 1.
                Text(coursesViewModel.messages)
                
                // 2.
                ForEach(coursesViewModel.courses) { course in
                    Text(course.name)
                }
            }
            .navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                print("Fetching JSON data..")
                
                //Change messages inside ViewModel
                // self.coursesViewModel.changeMessage()
                self.coursesViewModel.fetchCourses()
            }, label: {
                Text("Fetch Courses")
            }))
        }
    }
}

// Preview
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
