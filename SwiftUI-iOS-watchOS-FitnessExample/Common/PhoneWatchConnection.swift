//
//  PhoneWatchConnection.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 06/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import WatchConnectivity

/*
 Defines the common functions for Phone and Watch connection handlers
 synchronizeData and getLastData are mandatory as we send data back and forth from the Watch
 while getUpdatedData is optional as we can provide an empty implementation and allows
 for the caller to be notified every time new data is send through the common session
 */

typealias PhoneWatchSharedData = [String:Any]

protocol PhoneWatchConnection {
    func synchronizeData(_ data:PhoneWatchSharedData)
    func getLastData() -> PhoneWatchSharedData
    func getUpdatedData(callback: @escaping(PhoneWatchSharedData) ->Void)
}

/*
 Common implementation for iPhone and Watch
 WCSessionDelegate cannot be implemented here as some methods
 are not available on both platforms
 This class is meant to be extended so at least the WCSessionDelegate
 can be implemented on each target
 */

class PhoneWatchConnectionHandler : NSObject {
    var session:WCSession?
    var pendingContext:PhoneWatchSharedData?
    var updateCallback:((PhoneWatchSharedData) ->Void)?
    
    func initSession(withPendingContext: PhoneWatchSharedData?) {
        preconditionFailure("must override this function in subclasses")
    }
    
    func sendDataToCounterpart(_ context:PhoneWatchSharedData) {
        if session == nil {
            initSession(withPendingContext: context)
        }
        else {
            synchronizeData(context)
        }
    }
}

// MARK: PhoneWatchConnection functions

extension PhoneWatchConnectionHandler : PhoneWatchConnection {
    
    func synchronizeData(_ data: PhoneWatchSharedData) {
        do {
            try session?.updateApplicationContext(data)
        }
        catch {
            print("error while setting application context")
        }
    }
    
    func getLastData() -> PhoneWatchSharedData {
        return session?.applicationContext ?? [:]
    }
    
    func getUpdatedData(callback: @escaping (PhoneWatchSharedData) -> Void) {
        updateCallback = callback
    }
}

// MARK: PhoneWatchConnection static functions

extension PhoneWatchConnectionHandler {
    static func createDirectory(atPath path:String) {
        let manager = FileManager()
        if manager.fileExists(atPath: path) == false {
            let directoryURL = URL(fileURLWithPath: path)
            do {
                try manager.createDirectory(at: directoryURL, withIntermediateDirectories: false, attributes: nil)
            }
            catch {
                print("error while creating directory at path \(path)")
            }
        }
    }
}
