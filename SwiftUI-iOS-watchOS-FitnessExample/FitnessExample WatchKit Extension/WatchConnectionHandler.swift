//
//  WatchWorkoutManager.swift
//  FitnessExample WatchKit Extension
//
//  Created by Gualtiero Frigerio on 05/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import WatchConnectivity

class WatchConnectionHandler : PhoneWatchConnectionHandler {
    
    var imagesFolder:String!
    var firstMessageSent = false
    
    override init() {
        super.init()
        initSession(withPendingContext: nil)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        imagesFolder = documentsPath + "/watch"
        PhoneWatchConnectionHandler.createDirectory(atPath: imagesFolder)
    }
    
    override func initSession(withPendingContext: PhoneWatchSharedData?) {
        if WCSession.isSupported() {
            session = WCSession.default
            session!.delegate = self
            session!.activate()
            pendingContext = withPendingContext
        }
    }
    
    func fullPathForImage(withName name:String) -> String {
        return imagesFolder + "/" + name
    }
}

// MARK: - WCSessionDelegate

extension WatchConnectionHandler :  WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if activationState == .activated {
            print("activationDidComplete on Watch")
            let message = ["action" : "sendWorkouts"]
            sendMessageToPhone(message: message)
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print("sessionReachabilityDidChange")
        if session.isReachable {
            if firstMessageSent == false {
                let message = ["action" : "sendWorkouts"]
                sendMessageToPhone(message: message)
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("didReceiveApplicationContext on Watch")
        if let callback = updateCallback {
            callback(applicationContext)
        }
    }
    
    func session(_ session: WCSession, didReceive file: WCSessionFile) {
        print("Watch didReceive file")
        let fileName = file.fileURL.lastPathComponent
        let destinationPath = self.imagesFolder + "/" + fileName
        let destinationURL = URL(fileURLWithPath: destinationPath)
        let manager = FileManager()
        do {
            try manager.copyItem(at: file.fileURL, to: destinationURL)
        }
        catch {
            print("error while copying file from \(file.fileURL) to (destinationURL)")
        }
    }
}

// MARK: - Private

extension WatchConnectionHandler {
    private func sendMessageToPhone(message:[String:Any]) {
        guard let session = session else {return}
        session.sendMessage(message, replyHandler: { (response) in
            self.firstMessageSent = true
            if let callback = self.updateCallback {
                callback(response)
            }
        }) { (error) in
            print("error while sending message from the Watch")
            
        }
    }
}
