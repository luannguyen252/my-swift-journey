//
//  ContentView.swift
//  MVVMApp
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

// Models
struct Person {
    var name: String
     var age: Int
    var birthday: Date
}

// ViewModels
class ContentViewModel: ObservableObject {
    @Published private var person = Person(name: "Luan Nguyen", age: 29, birthday: Date())
    
    var name: String {
        person.name
    }
    
    var age: String {
        // date magic -> age string
        return "30"
    }
    
    // Intent
    func changeName(_ name: String) {
        person.name = name
    }
}

// Views
struct ContentView: View {
    // let person = Person(name: "Luan Nguyen", age: 30, birthday: Date())
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 8) {
                // Text("Hello, I'm \(person.name).")
                // Text("I'm \(person.age) year-old.")
                 Text("Hello, I'm \(viewModel.name).")
                 Text("I'm \(viewModel.age) year-old.")
            }
            .font(.title)
            .padding()
            
            Spacer()
            
            Button(action: {
                viewModel.changeName("Steve Jobs")
            }, label: {
                Text("Change Name")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color("AccentColor")))
            })
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
