//
//  PhoneWorkoutManager.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 05/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import UIKit
import WatchConnectivity

struct SyncListRecord {
    var url:URL!
    var session:WCSessionFileTransfer!
    
    init(url:URL, session:WCSessionFileTransfer) {
        self.url = url
        self.session = session
    }
}

class PhoneConnectionHandler : PhoneWatchConnectionHandler {
    
    var filePath:String!
    var watchImagesFolder:String!
    var syncList = [SyncListRecord]() // list of file to sync to the watch
    
    override init() {
        super.init()
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        filePath = documentsPath + "/workouts.json"
        watchImagesFolder = documentsPath + "/watch"
        PhoneWatchConnectionHandler.createDirectory(atPath: watchImagesFolder)
    }
    
    override func initSession(withPendingContext: PhoneWatchSharedData?) {
        if WCSession.isSupported() {
            session = WCSession.default
            session!.delegate = self
            session!.activate()
            pendingContext = withPendingContext
        }
    }
    
    func sendImageToWatch(_ image:UIImage, withName name:String) {
        guard let session = session else {return}
        if let smallImage = ImageManager.resizeImageForWatch(image) {
            let smallImagePath = pathForWatchImage(withName: name)
            ImageManager.saveImage(smallImage, toPath: smallImagePath, withFormat: ImageFormat.JPEG)
            let fileURL = URL(fileURLWithPath: smallImagePath)
            let fileSession = session.transferFile(fileURL, metadata: nil)
            let syncRecord = SyncListRecord(url:fileURL, session:fileSession)
            syncList.append(syncRecord)
        }
    }
}

// MARK: - WCSessionDelegate

extension PhoneConnectionHandler : WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if activationState == .activated {
            print("activationDidComplete on iPhone")
            if let context = pendingContext {
                sendContext(context)
            }
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive on iPhone")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate on iPhone")
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("didReceiveApplicationContext on iPhone")
        if let callback = updateCallback {
            callback(applicationContext)
        }
    }
    
    func session(_ session: WCSession, didFinish fileTransfer: WCSessionFileTransfer, error: Error?) {
        print("did finish file transfer")
        transferCompleted(fileTransfer: fileTransfer)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let action = message["action"] as? String {
            if action == "sendWorkouts" {
                if let pendingContext = pendingContext {
                    replyHandler(pendingContext)
                }
            }
        }
    }
}

// MARK: - Private functions

extension PhoneConnectionHandler {
    private func sendContext(_ context:[String:Any]) {
        do {
            try session?.updateApplicationContext(context)
        }
        catch {
            print("error while setting application context")
        }
    }
    
    func pathForWatchImage(withName name:String) -> String {
        return watchImagesFolder + "/" + name
    }
    
    private func transferCompleted(fileTransfer: WCSessionFileTransfer) {
        for i in 0..<syncList.count {
            if syncList[i].session == fileTransfer {
                syncList.remove(at: i)
                return
            }
        }
    }
}

