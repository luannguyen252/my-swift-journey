//
//  ContentView.swift
//  SwiftUIMVVMProgramWithObservableObject
//
//  Created by park kyung suk on 2020/06/17.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

let apiUrl =  "https://api.letsbuildthatapp.com/static/courses.json"

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
}

class CoursesViewModel: ObservableObject {
    
    @Published var messages = "Messages inside observable object"
    
    @Published var courses: [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3")
    ]
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            
            DispatchQueue.main.async {
                do {
                    self.courses =  try JSONDecoder().decode([Course].self, from: data!)
                }
                catch { }
            }
            
        }.resume()
        
    }
}

struct ContentView: View {
    
    //VMのプロパティを監視させるには @ObservedObjectをつけること
    @ObservedObject var coursesVM = CoursesViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text(coursesVM.messages)
                
                ForEach(coursesVM.courses) { course in
                    Text(course.name)
                }
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                
                self.coursesVM.fetchCourses()
            }, label: {
                Text("Fetch Cources")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
