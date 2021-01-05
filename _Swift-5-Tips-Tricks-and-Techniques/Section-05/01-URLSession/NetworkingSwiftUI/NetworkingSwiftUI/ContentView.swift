//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Philipp Baldauf on 22.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let url = URL(string: "https://swapi.co/api/people/")!
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let string = String(data: data, encoding: .utf8)
                print(string)
            } else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("No data received")
                }
            }
        }
        dataTask.resume()
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
