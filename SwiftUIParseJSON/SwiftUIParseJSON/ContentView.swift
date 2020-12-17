//
//  ContentView.swift
//  SwiftUIParseJSON
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

// MARK: - DATA MODEL
struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var fetch = FetchToDo()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                    Text("\(todo.completed.description)")
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                } //: VSTACK
            } //: LIST
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - FETCH JSON DATA
class FetchToDo: ObservableObject {
  @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
