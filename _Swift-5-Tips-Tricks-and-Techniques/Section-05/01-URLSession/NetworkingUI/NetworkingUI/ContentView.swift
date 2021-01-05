//
//  ContentView.swift
//  NetworkingUI
//
//  Created by Philipp Baldauf on 20.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    init() {
        // 1.
//        let url = URL(string: "https://swapi.co/api/people/")!
//        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            print(data)
//        }
//        session.resume()
        
        let url = URL(string: "https://swapi.co/api/people/")!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let string = String(data: data, encoding: .utf8)
                print(string)
            } else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Could not load data")
                }
            }
        }
        dataTask.resume()
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataDontLoad, timeoutInterval: 1)
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        let session = URLSession(configuration: config)
        let cacheTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let string = String(data: data, encoding: .utf8)
                print("Cached data \(string)")
            } else {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Could not load data")
                }
            }
        }
        cacheTask.resume()
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
