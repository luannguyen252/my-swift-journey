//
//  PhoneConnectivityProvider.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation
import os
import WatchConnectivity

final class PhoneConnectivityProvider: NSObject, WCSessionDelegate {
    
    // MARK: Creating the Provider
    
    private let session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
    }
    
    // MARK: Managing Connection
    
    func connect() {
        guard WCSession.isSupported() else {
            os_log(.debug, log: .phone, "phone session is not supported")
            return
        }
        os_log(.debug, log: .phone, "activating phone session")
        session.activate()
    }
    
    // MARK: Sending Data to Watch
    
    func refreshAllPlants(withCompletionHandler completionHandler: @escaping ([Plant]?) -> Void) {
        guard session.activationState == .activated else {
            os_log(.debug, log: .phone, "session is not active")
            completionHandler(nil)
            return
        }
        let message = [WatchCommunication.requestKey: WatchCommunication.Content.allPlants.rawValue]
        session.sendMessage(message, replyHandler: { (payload) in
            let plantDictionaries = payload[WatchCommunication.responseKey] as? [[String: Any]]
            os_log(.debug, log: .phone, "received %lu plants", plantDictionaries?.count ?? 0)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let plants = plantDictionaries?.compactMap({ Plant(dictionary: $0, decoder: decoder) })
            DispatchQueue.main.async {
                completionHandler(plants)
            }
        }, errorHandler: { error in
            os_log(.debug, log: .phone, "sending message failed: %s", error.localizedDescription)
        })
    }
    
    // MARK: Watch Session Delegate
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        os_log(.debug, log: .phone, "did finish activating session %lu (error: %s)", activationState == .activated, error?.localizedDescription ?? "none")
    }
}
