//
//  RRAlamofireRxAPI.swift
//  RRSwiftUIAPICalling
//
//  Created by Rahul Mayani on 09/07/20.
//  Copyright © 2020 RR. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Alamofire

public struct RRAPIRxManager: ObservableType {
    
    public typealias Element = Any       // The response data type.
    
    var apiUrl: String                  // The URL.
    var httpMethod: HTTPMethod          // The HTTP method.
    var param: [String:Any]?            // The parameters.
    var showingIndicator: Bool = false  // The custom indicator.
    
    // Responsible for creating and managing `Request` objects, as well as their underlying `NSURLSession`.
    static var manager : Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 1200.0
        return Alamofire.Session(configuration: configuration)
    }()
    
    // The HTTP headers. `nil` by default.
    static private func header() -> HTTPHeaders {
        var header = HTTPHeaders()
        header["Content-Type"] = "application/json"
        //header["Authorization"] = "Bearer" + " " + token
        return header
    }
    
    // The parameter encoding. `URLEncoding.default` by default.
    static private func encoding(_ httpMethod: HTTPMethod) -> ParameterEncoding {
        var encoding : ParameterEncoding = JSONEncoding.default
        if httpMethod == .get{
            encoding = URLEncoding.default
        }
        return encoding
    }
    
    public func subscribe<Observer>(_ observer: Observer) -> Disposable where Observer : ObserverType, RRAPIRxManager.Element == Observer.Element {
        
        if showingIndicator {
            RRLoader.startLoaderToAnimating()
        }
        
        let task = RRAPIRxManager.manager.request(apiUrl,
                                                 method: httpMethod,
                                                 parameters: param,
                                                 encoding: RRAPIRxManager.encoding(httpMethod),
                                                 headers: RRAPIRxManager.header())
            .responseJSON { (response) in
            
            RRLoader.stopLoaderToAnimating()
                
            if response.response?.statusCode == StatusCode.unAuthorized.rawValue { // User unauthorized
                observer.onError(NSError(domain: response.request?.url?.absoluteString ?? "", code: StatusCode.unAuthorized.rawValue, userInfo: nil))
                return
            }
                
            switch response.result {
                case .success :
                    observer.onNext(response.value as RRAPIRxManager.Element)
                    observer.onCompleted()
                    break
                case .failure(let error):
                    if (error as NSError).code == StatusCode.noInternetConnection.rawValue {
                        observer.onError(NSError(domain: response.request?.url?.absoluteString ?? "", code: StatusCode.noInternetConnection.rawValue, userInfo: nil))
                    } else {
                        observer.onError(error)
                    }
                    break
            }
        }
        
        task.resume()
        
        // cURL Request Output
        debugPrint(" cURL Request ")
        debugPrint(task)
        debugPrint("")
        
        return Disposables.create { task.cancel() }
    }
}

extension RRAPIRxManager {
    
    public static func rxCall(apiUrl: String, httpMethod: HTTPMethod = .get, param: [String:Any]? = nil, showingIndicator: Bool = false) -> Observable<Element> {
        return Observable.deferred {
            return RRAPIRxManager(apiUrl: apiUrl,
                                 httpMethod: httpMethod,
                                 param: param,
                                 showingIndicator: showingIndicator)
                  .asObservable()
        }
    }
}

extension ObservableType {
    
    /**
     Makes the observable Subscribe to concurrent background thread and Observe on main thread
     */
    public func subscribeConcurrentBackgroundToMainThreads() -> Observable<Element> {
        return self.subscribeOn(RXScheduler.concurrentBackground)
            .observeOn(RXScheduler.main)
    }
}

public struct RXScheduler {
    static let main = MainScheduler.instance
    static let concurrentMain = ConcurrentMainScheduler.instance

    static let serialBackground = SerialDispatchQueueScheduler.init(qos: .background)
    static let concurrentBackground = ConcurrentDispatchQueueScheduler.init(qos: .background)

    static let serialUtility = SerialDispatchQueueScheduler.init(qos: .utility)
    static let concurrentUtility = ConcurrentDispatchQueueScheduler.init(qos: .utility)

    static let serialUser = SerialDispatchQueueScheduler.init(qos: .userInitiated)
    static let concurrentUser = ConcurrentDispatchQueueScheduler.init(qos: .userInitiated)

    static let serialInteractive = SerialDispatchQueueScheduler.init(qos: .userInteractive)
    static let concurrentInteractive = ConcurrentDispatchQueueScheduler.init(qos: .userInteractive)
}

enum StatusCode: Int {
    case ok = 200
    case create = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unAuthorized = 401
    case forbidden = 403
    case noFound = 404
    case methodNotAllow = 405
    case conflict = 409
    case serverError = 500
    case unavailable = 503
    case requestTimeout = 408
    case noInternetConnection = -1009
}

