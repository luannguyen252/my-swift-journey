//
//  SwiftUIAPICalling.swift
//  RRSwiftUIAPICalling
//
//  Created by Rahul Mayani on 09/07/20.
//  Copyright © 2020 RR. All rights reserved.
//

import SwiftUI
import RxSwift

struct JokesData : Identifiable{
    
    public var id: Int
    public var joke: String
}

class APIObserver : ObservableObject{
    @Published var jokes = [JokesData]()

    let rxbag = DisposeBag()
    
    init() {
        getJokes()
    }
    
    func getJokes(count: Int = 2)
    {
        RRAPIRxManager.rxCall(apiUrl: "http://api.icndb.com/jokes/random/\(count)", showingIndicator: true)
        /*.delaySubscription(.seconds(5), scheduler: RXScheduler.concurrentBackground)*/
        .subscribeConcurrentBackgroundToMainThreads()
        .subscribe(onNext: { response in
            print(response)
            if let dictionaryArray = response as? Dictionary<String, AnyObject?> {
                let jsonArray = dictionaryArray["value"]

                if let jsonArray = jsonArray as? Array<Dictionary<String, AnyObject?>>{
                    for i in 0..<jsonArray.count{
                        let json = jsonArray[i]
                        if let id = json["id"] as? Int, let jokeString = json["joke"] as? String{
                        self.jokes.append(JokesData(id: id, joke: jokeString))
                        }
                    }
                }
            }
        }, onError: { error in
            print(error)
        }).disposed(by: rxbag)
    }
}
