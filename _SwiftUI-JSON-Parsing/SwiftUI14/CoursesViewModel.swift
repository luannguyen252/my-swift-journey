//
//  CoursesViewModel.swift
//  SwiftUI14
//
//  Created by Rohit Saini on 21/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI
import Foundation

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"
class CoursesViewModel:ObservableObject{
    @Published var courses:[Course] = [.init(name: "abc", bannerUrl: "abc")]
    func fetchCourses(){
        guard let url = URL(string: apiUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url){(data,res,err) in
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
                print(self.courses)
            }
        }.resume()
    }
}

struct Course:Decodable,Identifiable {
    let id = UUID()
    let name,bannerUrl: String
}
