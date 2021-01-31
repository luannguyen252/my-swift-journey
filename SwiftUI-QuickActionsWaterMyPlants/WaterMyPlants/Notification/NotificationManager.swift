//
//  NotificationManager.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UserNotifications
import os

final class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    private let notificationCenter: UNUserNotificationCenter
    
    init(center: UNUserNotificationCenter = .current()) {
        self.notificationCenter = center
        super.init()
        center.delegate = self
    }
        
    // MARK: User Notification Delegate
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        handleNotificationResponse(response)
        completionHandler()
    }

    private func handleNotificationResponse(_ response: UNNotificationResponse) {
        let category = response.notification.request.content.categoryIdentifier
        guard category == "WATERING_REMINDER" else { return }
        let userInfo = response.notification.request.content.userInfo as! [String: Any]
        guard let plantInfo = userInfo["plant"] as? [String: Any] else {
            os_log(.debug, log: .plants, "Notification does not contain plant")
            return
        }
        guard let plantId = plantInfo["id"] as? String else {
            os_log(.debug, log: .plants, "Notification does not contain id")
            return
        }
        switch response.actionIdentifier {
        case "water_done":
            os_log(.debug, log: .plants, "Watering done %s", plantId)
        case "water_later":
            os_log(.debug, log: .plants, "Water later %s", plantId)
        case "water_tomorrow":
            os_log(.debug, log: .plants, "Water tomorrow %s", plantId)
        default:
            os_log(.debug, log: .plants, "Unknown action %s", response.actionIdentifier)
        }
    }
}
