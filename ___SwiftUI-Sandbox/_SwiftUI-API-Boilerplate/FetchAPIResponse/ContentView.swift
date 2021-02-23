//
//  ContentView.swift
//  FetchAPIResponse
//
//  Created by Navdeep Singh on 4/16/20.
//  Copyright © 2020 Navdeep Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [TaskEntry]()
    
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
            }
        }.onAppear(perform: loadData)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
