//
//  WatchConnectivityProvider.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import CoreData
import Foundation
import os
import WatchConnectivity

final class WatchConnectivityProvider: NSObject, WCSessionDelegate {
    
    // MARK: Creating the Provider
    
    private let persistentContainer: NSPersistentContainer
    private let session: WCSession
    
    init(session: WCSession = .default, persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        self.session = session
        super.init()
        session.delegate = self
    }
    
    // MARK: Managing Connection
    
    func connect() {
        guard WCSession.isSupported() else {
            os_log(.debug, log: .watch, "watch session is not supported")
            return
        }
        os_log(.debug, log: .watch, "activating watch session")
        session.activate()
    }
    
    // MARK: Sending Data to Watch
    
    func notePlantsDidChange() {
        guard session.activationState == .activated else {
            os_log(.debug, log: .watch, "session is not active")
            return
        }
        
        do {
            let context: [String: Any] = [:]
            try session.updateApplicationContext(context)
        }
        catch let nsError as NSError {
            os_log(.debug, log: .watch, "failed updating application context with error %s", nsError.localizedDescription)
        }
    }
    
    // MARK: Watch Session Delegate
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        os_log(.debug, log: .watch, "session became inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        os_log(.debug, log: .watch, "session deactivated")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any], replyHandler: @escaping ([String: Any]) -> Void) {
        os_log(.debug, log: .watch, "did receive message: %s", message[WatchCommunication.requestKey] as? String ?? "unknown")
        guard let contentString = message[WatchCommunication.requestKey] as? String , let content = WatchCommunication.Content(rawValue: contentString) else {
            replyHandler([:])
            return
        }
        switch content {
        case .allPlants:
            persistentContainer.performBackgroundTask { (managedObjectContext) in            
                let all = Plant.allPlantsDictionaryRepresentation() as! [[String: Any]]
                // Replace Date with Double
                let converted = all.map { (plantDictionary) -> [String: Any] in
                    plantDictionary.mapValues { (value) -> Any in
                        if let date = value as? Date {
                            return date.timeIntervalSince1970
                        }
                        else {
                            return value
                        }
                    }
                }                
                let response = [WatchCommunication.responseKey: converted]
                replyHandler(response)
            }
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        os_log(.debug, log: .watch, "did finish activating session %lu (error: %s)", activationState == .activated, error?.localizedDescription ?? "")
    }
}
